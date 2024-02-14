import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newsui/school_model.dart';
import 'package:http/http.dart' as http;

class SchoolApp extends StatefulWidget {
  const SchoolApp({super.key});

  @override
  State<SchoolApp> createState() => _SchoolAppState();
}

class _SchoolAppState extends State<SchoolApp> {
  Future<SchoolModel> fetchSchoolData() async {
    final url = "https://api.school.com/v1/school";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      log(result);
      return SchoolModel.fromJson(result);
    } else {
      return SchoolModel();
    }
  }

  @override
  void initState() {
    super.initState();
    log(fetchSchoolData().hashCode.bitLength);
    fetchSchoolData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(153, 124, 77, 255),
        title: Text(
          "School App",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fetchSchoolData(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.deepPurple[50],
                ),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("School Data"),
                          content: Text(
                              "School Name: ${snapshot.data?.html?.body?.div?.h1?.characters}"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Close"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: ListTile(
                    title: Text(
                        "${snapshot.data?.html?.body?.div?.h1?.characters}"),
                    subtitle: Text(
                        "${snapshot.data?.html?.body?.div?.h1?.codeUnits}"),
                    leading:
                        Text("${snapshot.data?.html?.body?.div?.h1?.runes}"),
                    trailing: Text(
                        "${snapshot.data?.html?.body?.div?.h1?.runtimeType}"),
                  ),
                ),
              );
            },
            itemCount: snapshot.data?.html?.body?.div?.h1?.length,
          );
        },
      ),
    );
  }
}
