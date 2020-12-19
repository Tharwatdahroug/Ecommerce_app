import 'package:ecommerce/screen/login.dart';
import 'package:ecommerce/screen/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  static const routeName = '/login';
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Stack(children: <Widget>[
      Container(
        color: Color.fromRGBO(87, 87, 243, 1),
        // Color.fromRGBO(192, 255, 255, 1)
      ),
      SingleChildScrollView(
        child: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Container(
                  child: Image.network(
                    'https://c.top4top.io/p_18045nrfk1.png',
                    height: deviceSize.height * 0.5,
                    width: deviceSize.width * 0.7,
                  ),
                ),
              ),
              Flexible(
                flex: deviceSize.width > 600 ? 2 : 1,
                child: SingleChildScrollView(child: botten_widgit()),
              )
            ],
          ),
        ),
      )
    ]);
  }
}

class botten_widgit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: deviceSize.width / 1.5,
          height: deviceSize.width / 7,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 4),
              borderRadius: BorderRadius.circular(40),
            ),
            child: RaisedButton(
              color: Color.fromRGBO(87, 87, 243, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              padding: EdgeInsets.all(0),
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              onPressed: () {
                // Navigator.of(context)
                //     .pushNamedAndRemoveUntil(login.routeName, (route) => false);
                Navigator.of(context).pushReplacementNamed(login.routeName);
              },
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: deviceSize.width / 1.5,
          height: deviceSize.width / 7,
          child: RaisedButton(
            color: Color.fromRGBO(255, 255, 255, 1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            padding: EdgeInsets.all(10),
            child: Text(
              "Sign up",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(87, 87, 243, 1)),
            ),
            onPressed: () {
              // Navigator.of(context)
              //     .pushNamedAndRemoveUntil(sigup.routeName, (route) => false);
              Navigator.of(context).pushReplacementNamed(sigup.routeName);
            },
          ),
        ),
      ],
    );
  }
}
