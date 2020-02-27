import 'package:flutter/material.dart';

class NingHao extends StatelessWidget {
  final String title;
  NingHao({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: ListView(children: <Widget>[]),
    );
  }
}

class ListItem extends StatelessWidget {
  // 控制生成路由与控件的对应关系
  final String title;
  final Widget page;

  ListItem({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}
