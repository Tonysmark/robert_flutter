import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:robert_flutter/pages/Tab2/animations/FadeAnimate.dart';
import 'package:robert_flutter/pages/Tab2/pages/login_page.dart';

/// @dependecies   simple_animations: ^1.3.6 page_transition: ^1.1.5
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  // TODO TickerProviderStateMixin ????

  AnimationController _scaleController;
  AnimationController _scale2Controller;
  AnimationController _widthController;
  AnimationController _positionController;
  Animation<double> _scaleAnimation;
  Animation<double> _scale2Animation;
  Animation<double> _widthAnimation;
  Animation<double> _positionAnimation;

  bool isHideIcon = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    this._scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.8,
    ).animate(this._scaleController)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            this._widthController.forward();
          }
        },
      );

    this._widthController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    this._widthAnimation = Tween<double>(
      begin: 80,
      end: 300,
    ).animate(this._widthController)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            this._positionController.forward();
          }
        },
      );

    this._positionController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    this._positionAnimation = Tween<double>(
      begin: 0,
      end: 215,
    ).animate(this._positionController)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            this._scale2Controller.forward();
            setState(() {
              this.isHideIcon = true;
            });
          }
        },
      );

    this._scale2Controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    this._scale2Animation = Tween<double>(
      begin: 1,
      end: 40,
    ).animate(_scale2Controller)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            Navigator.push(
              context,
              PageTransition(child: LoginPage(), type: PageTransitionType.fade),
            );
          }
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      backgroundColor: Colors.white30,
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -50,
              left: 0,
              child: FadeAnimation(
                1,
                Container(
                  width: width,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/one.png'), fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -100,
              left: 0,
              child: FadeAnimation(
                1.3,
                Container(
                  width: width,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/one.png'), fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -150,
              left: 0,
              child: FadeAnimation(
                1.6,
                Container(
                  width: width,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/one.png'), fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                    1,
                    Text(
                      "Welcome",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  SizedBox(height: 15),
                  FadeAnimation(
                    1.3,
                    Text(
                      "We promise thay you'll have the most \n fuss-free time with us",
                      style: TextStyle(color: Colors.white.withOpacity(.7), height: 1.4),
                    ),
                  ),
                  SizedBox(height: 180),
                  FadeAnimation(
                    1.6,
                    AnimatedBuilder(
                      animation: this._scaleController,
                      builder: (context, child) => Transform.scale(
                        scale: this._scaleAnimation.value,
                        child: Center(
                          child: AnimatedBuilder(
                            animation: this._widthController,
                            builder: (context, child) => Container(
                              width: this._widthAnimation.value,
                              height: 80,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blue.withOpacity(.4),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(50),
                                onTap: () {
                                  this._scaleController.forward();
                                },
                                child: Stack(
                                  children: <Widget>[
                                    AnimatedBuilder(
                                      animation: this._positionController,
                                      builder: (context, child) => Positioned(
                                        left: _positionAnimation.value,
                                        child: AnimatedBuilder(
                                          animation: _scale2Controller,
                                          builder: (context, child) => Transform.scale(
                                            scale: _scale2Animation.value,
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.blue,
                                              ),
                                              child: isHideIcon ? Container() : Icon(Icons.arrow_forward, color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
