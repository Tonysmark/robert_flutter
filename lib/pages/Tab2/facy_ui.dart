import 'package:flutter/material.dart';
import 'package:robert_flutter/pages/Tab2/pages/login2.dart';
import 'package:robert_flutter/pages/Tab2/pages/login_page.dart';
import 'package:robert_flutter/pages/Tab2/pages/onboarding.dart';
import 'package:robert_flutter/pages/Tab2/pages/splash_screen.dart';

class FancyUi extends StatelessWidget {
  final String imageUrl = 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=33527847,1467350213&fm=26&gp=0.jpg';
  final String title;
  FancyUi({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.add), onPressed: () {}),
              IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
            ],
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Fancy Pages'),
              background: Image.network(imageUrl, fit: BoxFit.cover),
              collapseMode: CollapseMode.parallax, // 图片折叠方式
            ),
          ),
          SliverSafeArea(sliver: SliverListItem())
        ],
      ),
    );
  }
}

class PageItem {
  final String title;
  final Widget page;

  PageItem({this.title, this.page});
}

class SliverListItem extends StatelessWidget {
  final List<PageItem> pages = [
    PageItem(title: 'login page', page: LoginPage()),
    PageItem(title: 'LoginPage2', page: LoginPage2()),
    PageItem(title: 'Splash screen', page: SplashScreen()),
    PageItem(title: 'Onboarding', page: OnBoarding()),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        _childBuilder,
        childCount: pages.length,
      ),
    );
  }

  Widget _childBuilder(BuildContext context, int index) {
    return ListTile(
      title: Text(pages[index].title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pages[index].page),
        );
      },
    );
  }
}
