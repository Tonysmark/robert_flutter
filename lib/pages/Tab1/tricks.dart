import 'package:flutter/material.dart';
import 'package:robert_flutter/pages/Tab1/components/custom_scrollview.dart';
import 'package:robert_flutter/pages/Tab1/components/fluent_navbar.dart';
import 'package:robert_flutter/pages/Tab1/components/hero.dart';

class TrickContainer extends StatelessWidget {
  final String title;

  TrickContainer({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Tricks(),
    );
  }
}

class Tricks extends StatefulWidget {
  @override
  _TricksState createState() => _TricksState();
}

class _TricksState extends State<Tricks> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListItem(title: "FluentNavigation", page: FluentNav()),
        ListItem(title: "HeroWidget", page: HeroWidget()),
        ListItem(title: "CusScrollView", page: ScrollviewWrapper()),
      ],
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
