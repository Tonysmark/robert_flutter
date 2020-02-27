import 'package:flutter/material.dart';
import 'package:robert_flutter/theme/base_theme.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final int pages = 3;
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  List<Widget> _indecatorbuilder() {
    List<Widget> list = [];
    for (int i = 0; i < pages; i++) {
      list.add(i == _currentPage ? _indecator(true) : _indecator(false));
    }
    debugPrint("$list");
    return list;
  }

  Widget _indecator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 5,
      width: isActive ? 20 : 12,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Color(0xFF7B51D3),
          borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: [
              Color(0xFF3594DD),
              Color(0xFF4563DB),
              Color(0xFF5036D5),
              Color(0xFF5B16D0),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Skip',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: 600,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      this._currentPage = page;
                    });
                  },
                  children: <Widget>[FirstIntro(), SecondIntro(), ThirdIntro()],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _indecatorbuilder(),
              ),
              _currentPage != pages - 1
                  ? Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight,
                        child: FlatButton(
                          onPressed: () {
                            this._pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.arrow_forward,
                                size: 30,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : Text(''),
            ],
          ),
        ),
      ),
      bottomSheet: _currentPage == pages - 1
          ? Container(
              height: 100,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () {},
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Text(
                      "Get started",
                      style: TextStyle(
                        color: Color(0xFF5B16D0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}

class FirstIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage('assets/images/onboarding0.png'),
              width: 300,
              height: 300,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Live your life smarter \nwith us',
            style: kTitleStyle,
          ),
          SizedBox(height: 15),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: kSubtitleStyle,
          )
        ],
      ),
    );
  }
}

class SecondIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage('assets/images/onboarding1.png'),
              width: 300,
              height: 300,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Connect people \naround the world',
            style: kTitleStyle,
          ),
          SizedBox(height: 15),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: kSubtitleStyle,
          )
        ],
      ),
    );
  }
}

class ThirdIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage('assets/images/onboarding2.png'),
              width: 300,
              height: 300,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Get a new expirence \nof imagination',
            style: kTitleStyle,
          ),
          SizedBox(height: 15),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: kSubtitleStyle,
          )
        ],
      ),
    );
  }
}
