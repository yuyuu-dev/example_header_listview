import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      {
        "name": "ブログ",
        "url": "https://yuyuublog.com",
      },
      {
        "name": "Twitter",
        "url": "https://twitter.com/yuyuublog",
      },
      {
        "name": "Instagram",
        "url": "https://www.instagram.com/yuyuublog",
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ヘッダー付きのListView'),
        ),
        body: new Column(children: <Widget>[
          _listHeader(),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: items == null ? 0 : items.length,
            itemBuilder: (context, index) {
              return _listTile(items[index]);
            },
          ),
        ]),
      ),
    );
  }

  Widget _listHeader() {
    return Container(
        decoration: new BoxDecoration(
            border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
        ),
        child: ListTile(
            title: new Row(
                children: <Widget>[
                  new Expanded(child: new Text("名称", style: new TextStyle(fontWeight:FontWeight.bold))),
                  new Expanded(child: new Text("URL", style: new TextStyle(fontWeight:FontWeight.bold))),
                ]
            )
        )
    );
  }

  Widget _listTile(items) {
    return Container(
        decoration: new BoxDecoration(
            border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
        ),
        child: ListTile(
            title: new Row(children: <Widget>[
              new Expanded(child: Text("${items["name"]}")),
              new Expanded(child: Text("${items["url"]}")),
            ]
            )
        )
    );
  }
}
