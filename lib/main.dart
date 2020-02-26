import 'package:flutter/material.dart';
import 'package:robert_flutter/pages/Tab1/tricks.dart';
import 'package:robert_flutter/pages/Tab2/facy_ui.dart';
import 'package:robert_flutter/pages/Tab3/ninghao.dart';
import 'package:robert_flutter/pages/Tab4/samples.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainModule(),
    );
  }
}

class MainModule extends StatefulWidget {
  @override
  _MainModuleState createState() => _MainModuleState();
}

class _MainModuleState extends State<MainModule> {
  int _currentIndex = 0;
  List<Widget> pageViews = [TrickContainer(title: '骚东西'), FancyUi(title: "UI设计"), NingHao(title: "宁浩网"), Samples(title: "零散")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageViews[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: this._currentIndex,
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Tricks')),
          BottomNavigationBarItem(icon: Icon(Icons.explore), title: Text('发现')),
          BottomNavigationBarItem(icon: Icon(Icons.airplay), title: Text('主页')),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('我的')),
        ],
      ),
    );
  }
}
