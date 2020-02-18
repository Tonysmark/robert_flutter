import 'package:flutter/material.dart';
import 'package:robert_flutter/pages/Tab1/tricks.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  List<Widget> PageViews = [
    TrickContainer(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageViews[this._currentIndex],
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
