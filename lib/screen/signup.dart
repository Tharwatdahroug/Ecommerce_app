import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/screen/login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home.dart';

class sigup extends StatefulWidget {
  @override
  static const routeName = '/sigup';
  _sigupState createState() => _sigupState();
}

class _sigupState extends State<sigup> {
  final mainColor = Color.fromRGBO(87, 87, 243, 1);
  bool _showsee = true;
  bool _notshowsee = false;
  final _emailFocusenode = FocusNode();
  final _paswordFocusenode = FocusNode();
  final _confirmpaswordFocusenode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _loginData = {
    'email': '',
    'name': '',
    'password': '',
  };
  var _isLoading = false;
  void _submit() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    Navigator.of(context).pushNamed(Home.routeName);
  }

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _confirmpaswordFocusenode.dispose();
    _paswordFocusenode.dispose();
    _emailFocusenode.dispose();
    super.dispose();
  }

  @override
  Widget _buildLogo() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Image.network(
                "https://c.top4top.io/p_18045nrfk1.png",
                height: MediaQuery.of(context).size.height / 3,
              ))
        ],
      ),
    );
  }

  Widget _buildnameRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.black),
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_emailFocusenode);
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.person,
              color: mainColor,
            ),
            labelText: 'Name'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please Enter Your Name';
          }
        },
        onSaved: (value) => _loginData['name'] = value,
      ),
    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.black),
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_paswordFocusenode);
        },
        focusNode: _emailFocusenode,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: mainColor,
            ),
            labelText: 'E-mail'),
        validator: (value) {
          if (value.isEmpty || !value.contains('@')) {
            return 'Invalid email!';
          }
        },
        onSaved: (value) {
          _loginData['email'] = value;
        },
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: _passwordController,
        focusNode: _paswordFocusenode,
        keyboardType: TextInputType.text,
        obscureText: _showsee,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: mainColor,
          ),
          labelText: 'Password',
          suffixIcon: _showsee
              ? IconButton(
                  icon: Icon(Icons.remove_red_eye, color: mainColor),
                  onPressed: () {
                    setState(() {
                      _showsee = _notshowsee;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.remove_red_eye_outlined, color: mainColor),
                  onPressed: () {
                    setState(() {
                      _showsee = true;
                    });
                  },
                ),
        ),
        validator: (value) {
          if (value.isEmpty || value.length < 5) {
            return 'Password is too short!';
          }
        },
        onSaved: (value) {
          _loginData['password'] = value;
        },
      ),
    );
  }

  Widget _buildConfirmPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        focusNode: _paswordFocusenode,
        keyboardType: TextInputType.text,
        controller: _passwordController,
        obscureText: _showsee,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: mainColor,
          ),
          labelText: 'Confirm Password',
          suffixIcon: _showsee
              ? IconButton(
                  icon: Icon(Icons.remove_red_eye, color: mainColor),
                  onPressed: () {
                    setState(() {
                      _showsee = _notshowsee;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.remove_red_eye_outlined, color: mainColor),
                  onPressed: () {
                    setState(() {
                      _showsee = true;
                    });
                  },
                ),
        ),
        validator: (value) {
          if (value != _passwordController.text) {
            return 'Passwords do not match!';
          }
        },
        // onSaved: (value) {
        //   _loginData['password'] = value;
        // },
      ),
    );
  }

  Widget _buildForgetPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text("Forgot Password"),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: _submit,
            child: Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildOrRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            '- OR -',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSocialBtnRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: mainColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0)
              ],
            ),
            child: Icon(
              FontAwesomeIcons.google,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainer() {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: <Widget>[
                        //     // Text(
                        //     //   "Login",
                        //     //   style: TextStyle(
                        //     //       fontSize:
                        //     //           MediaQuery.of(context).size.height / 30,
                        //     //       fontWeight: FontWeight.bold),
                        //     // ),
                        //   ],
                        // ),
                        _buildnameRow(),
                        _buildEmailRow(),
                        _buildPasswordRow(),
                        _buildConfirmPasswordRow(),
                        _buildForgetPasswordButton(),
                        _buildLoginButton(),
                        // _buildOrRow(),
                        // _buildSocialBtnRow(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(login.routeName);
            },
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Dont have an account? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height / 35,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'Login',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: MediaQuery.of(context).size.height / 35,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ]),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xfff2f3f7),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(70),
                    bottomRight: const Radius.circular(70),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildLogo(),
                  _buildContainer(),
                  _buildSignUpBtn(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
