import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:robert_flutter/theme/base_theme.dart';

class LoginPage2 extends StatefulWidget {
  @override
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  bool isHide = true;
  bool rememberMe = false;

  Widget _emailBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Email", style: kLabelStyle),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white, fontFamily: "OpenSans"),
            decoration: InputDecoration(
              hintText: "Enter your Email",
              hintStyle: kHintTextStyle,
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _passwordBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Password", style: kLabelStyle),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextField(
            obscureText: this.isHide,
            style: TextStyle(color: Colors.white, fontFamily: "OpenSans"),
            decoration: InputDecoration(
              hintText: "Enter your Password",
              hintStyle: kHintTextStyle,
              border: InputBorder.none,
              prefixIcon: Icon(Icons.lock, color: Colors.white),
              suffixIcon: IconButton(
                onPressed: () => setState(() => this.isHide = !this.isHide),
                icon:
                    Icon(this.isHide ? Icons.visibility_off : Icons.visibility),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          Container(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 120, horizontal: 40),
              child: Column(
                children: <Widget>[
                  Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  _emailBuilder(),
                  SizedBox(height: 30),
                  _passwordBuilder(),
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      padding: EdgeInsets.only(right: 0),
                      onPressed: () => print("forgot"),
                      child: Text('Forgot password?', style: kLabelStyle),
                    ),
                  ),
                  Container(
                    height: 25,
                    child: Row(
                      children: <Widget>[
                        Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.white),
                          child: Checkbox(
                            value: rememberMe,
                            checkColor: Colors.green,
                            activeColor: Colors.white,
                            onChanged: (value) =>
                                setState(() => this.rememberMe = value),
                          ),
                        ),
                        Text("Remember me", style: kLabelStyle)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 25),
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 5,
                      color: Colors.white,
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'login'.toUpperCase(),
                        style: TextStyle(
                          color: Color(0xFF527DAA),
                          letterSpacing: 1.5,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      onPressed: () {},
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text('- OR -',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      SizedBox(height: 20),
                      Text('Sign in with', style: kLabelStyle),
                      SizedBox(height: 30)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 6)
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Image.asset('assets/images/qq.png'),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 6)
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Image.asset('assets/images/wechat.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {},
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Don \'t have an Account? ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                          TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
