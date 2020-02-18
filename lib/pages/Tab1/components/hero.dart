import 'package:flutter/material.dart';
import 'package:robert_flutter/Model/posts.dart';

class HeroWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ATTENTION!!! use both tags in two widgets
    return Scaffold(
      appBar: AppBar(title: Text('Hero Demo')),
      body: Container(child: ListViewContainer()),
    );
  }
}

class ListViewContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: this.listBuilder,
      itemCount: posts.length,
    );
  }

  Widget listBuilder(BuildContext context, int index) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PostInfo(post: posts[index])));
      },
      leading: Hero(
        tag: posts[index].title,
        child: CircleAvatar(
          backgroundImage: NetworkImage(posts[index].imageUrl),
        ),
      ),
      title: Text(posts[index].title),
      subtitle: Text(
        posts[index].description,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class PostInfo extends StatelessWidget {
  final Post post;

  PostInfo({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: <Widget>[
          Hero(tag: post.title, child: Image.network(post.imageUrl)),
          Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(post.title, style: Theme.of(context).textTheme.title),
                SizedBox(height: 9),
                Text(post.author, style: Theme.of(context).textTheme.subhead),
                SizedBox(height: 32),
                Text(post.description, style: Theme.of(context).textTheme.body1)
              ],
            ),
          )
        ],
      ),
    );
  }
}
