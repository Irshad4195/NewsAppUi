import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsui/news_model.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<NewsModel> fetchNews() async {
    final url =
        "https://newsapi.org/v2/everything?q=tesla&from=2023-11-22&sortBy=publishedAt&apiKey=aef38f2fe7154a40b2ac58221cc493b3";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return NewsModel.fromJson(result);
    } else {
      return NewsModel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(153, 124, 77, 255),
          title: Text(
            "News App",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: fetchNews(),
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
                                title: Text(
                                    "${snapshot.data!.articles![index].title}"),
                                content: Text(
                                    "${snapshot.data!.articles![index].description}"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Close"))
                                ],
                              );
                            });
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: snapshot
                                      .data!.articles![index].urlToImage !=
                                  null
                              ? NetworkImage(
                                  "${snapshot.data!.articles![index].urlToImage}")
                              : NetworkImage(
                                  "https://bbb.th-luebeck.de/assets/default-avatar-12ba46e182bedfae9d6de6c3a414a91b85a2383adff1e06ba4261478c380d3e1.png"),
                        ),
                        title: snapshot.data!.articles![index].title != null
                            ? Text("${snapshot.data!.articles![index].title}")
                            : Text("No Title Found"),
                        subtitle: snapshot.data!.articles![index].author != null
                            ? Text("${snapshot.data!.articles![index].author}")
                            : Text("No Author Found"),
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data!.articles!.length,
              );
            }));
  }
}
