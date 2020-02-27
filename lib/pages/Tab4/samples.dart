import 'package:flutter/material.dart';
import 'package:robert_flutter/pages/Tab4/pages/state_management.dart';

class Samples extends StatelessWidget {
  final String title;

  Samples({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: "状态管理",
            page: StateManagement(),
          )
        ],
      ),
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
