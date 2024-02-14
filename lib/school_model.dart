class SchoolModel {
  String? _comment;
  Html? _html;

  SchoolModel({String? comment, Html? html}) {
    if (comment != null) {
      this._comment = comment;
    }
    if (html != null) {
      this._html = html;
    }
  }

  String? get comment => _comment;
  set comment(String? comment) => _comment = comment;
  Html? get html => _html;
  set html(Html? html) => _html = html;

  SchoolModel.fromJson(Map<String, dynamic> json) {
    _comment = json['#comment'];
    _html = json['html'] != null ? new Html.fromJson(json['html']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['#comment'] = this._comment;
    if (this._html != null) {
      data['html'] = this._html!.toJson();
    }
    return data;
  }
}

class Html {
  String? _lang;
  Head? _head;
  Body? _body;

  Html({String? lang, Head? head, Body? body}) {
    if (lang != null) {
      this._lang = lang;
    }
    if (head != null) {
      this._head = head;
    }
    if (body != null) {
      this._body = body;
    }
  }

  String? get lang => _lang;
  set lang(String? lang) => _lang = lang;
  Head? get head => _head;
  set head(Head? head) => _head = head;
  Body? get body => _body;
  set body(Body? body) => _body = body;

  Html.fromJson(Map<String, dynamic> json) {
    _lang = json['@lang'];
    _head = json['head'] != null ? new Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@lang'] = this._lang;
    if (this._head != null) {
      data['head'] = this._head!.toJson();
    }
    if (this._body != null) {
      data['body'] = this._body!.toJson();
    }
    return data;
  }
}

class Head {
  String? _title;
  Style? _style;

  Head({String? title, Style? style}) {
    if (title != null) {
      this._title = title;
    }
    if (style != null) {
      this._style = style;
    }
  }

  String? get title => _title;
  set title(String? title) => _title = title;
  Style? get style => _style;
  set style(Style? style) => _style = style;

  Head.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _style = json['style'] != null ? new Style.fromJson(json['style']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    if (this._style != null) {
      data['style'] = this._style!.toJson();
    }
    return data;
  }
}

class Style {
  String? _type;
  String? _text;

  Style({String? type, String? text}) {
    if (type != null) {
      this._type = type;
    }
    if (text != null) {
      this._text = text;
    }
  }

  String? get type => _type;
  set type(String? type) => _type = type;
  String? get text => _text;
  set text(String? text) => _text = text;

  Style.fromJson(Map<String, dynamic> json) {
    _type = json['@type'];
    _text = json['#text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this._type;
    data['#text'] = this._text;
    return data;
  }
}

class Body {
  Div? _div;

  Body({Div? div}) {
    if (div != null) {
      this._div = div;
    }
  }

  Div? get div => _div;
  set div(Div? div) => _div = div;

  Body.fromJson(Map<String, dynamic> json) {
    _div = json['div'] != null ? new Div.fromJson(json['div']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._div != null) {
      data['div'] = this._div!.toJson();
    }
    return data;
  }
}

class Div {
  String? _id;
  String? _h1;
  String? _p;

  Div({String? id, String? h1, String? p}) {
    if (id != null) {
      this._id = id;
    }
    if (h1 != null) {
      this._h1 = h1;
    }
    if (p != null) {
      this._p = p;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get h1 => _h1;
  set h1(String? h1) => _h1 = h1;
  String? get p => _p;
  set p(String? p) => _p = p;

  Div.fromJson(Map<String, dynamic> json) {
    _id = json['@id'];
    _h1 = json['h1'];
    _p = json['p'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@id'] = this._id;
    data['h1'] = this._h1;
    data['p'] = this._p;
    return data;
  }
}
