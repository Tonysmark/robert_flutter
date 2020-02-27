import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

/// 状态管理 https://www.youtube.com/watch?v=3tm-R7ymwhc&t=331s
///
///
class StateManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: counterService.stream$,
          builder: (BuildContext context, AsyncSnapshot asyncSnapshot) => Text("${asyncSnapshot.data}"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterService.increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}

class Counter {
  // ignore: close_sinks
  BehaviorSubject _counter = BehaviorSubject.seeded(0);

  get stream$ => this._counter.stream;

  get current => this._counter.value;

  increment() {
    _counter.add(current + 1);
  }
}

Counter counterService = Counter();
