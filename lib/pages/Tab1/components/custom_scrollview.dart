import 'package:flutter/material.dart';
import 'package:robert_flutter/Model/posts.dart';

class ScrollviewWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Sliver AppBar"),
              stretchModes: [StretchMode.fadeTitle],
              background: Image.network(posts[2].imageUrl, fit: BoxFit.cover),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(alignment: Alignment.center, color: Colors.lightBlue[100 * (index % 9)], child: Text('List Item $index'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
