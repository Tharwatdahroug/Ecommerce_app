import 'package:ecommerce/screen/about.dart';
import 'package:ecommerce/screen/home.dart';
import 'package:ecommerce/screen/order_screen.dart';
import 'package:ecommerce/screen/product_screen.dart';
import 'package:ecommerce/screen/use_product_screen.dart';
import 'package:ecommerce/widget/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class drawer extends StatelessWidget {
  final String image = 'https://c.top4top.io/p_18045nrfk1.png';
  final Color primary = Colors.white;
  final Color divider = Colors.grey.shade600;
  final Color active = Colors.grey.shade800;
  final TextStyle tStyle =
      TextStyle(color: Colors.grey.shade800, fontSize: 19.0);
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 100,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: active,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                  ),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.orange, Colors.deepOrange])),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(image),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "sarwatDahroyg",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "@sarwat",
                    style: TextStyle(color: active, fontSize: 16.0),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: ListTile(
                      title: Text(
                        "Home",
                        style: tStyle,
                      ),
                      leading: Icon(
                        Icons.home,
                        color: active,
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(Home.routeName);
                      },
                    ),
                  ),

                  // _buildRow(Icons.person_pin, "My profile"),
                  _buildDivider(),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: ListTile(
                      title: Text(
                        "Product",
                        style: tStyle,
                      ),
                      leading: Icon(
                        Icons.assignment_turned_in,
                        color: active,
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(product_screen.routeName);
                      },
                    ),
                  ),
                  _buildDivider(),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: ListTile(
                      title: Text(
                        "order",
                        style: tStyle,
                      ),
                      leading: Icon(
                        Icons.payment,
                        color: active,
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(order_screen.routeName);
                      },
                    ),
                  ),
                  _buildDivider(),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: ListTile(
                      title: Text(
                        "edit",
                        style: tStyle,
                      ),
                      leading: Icon(
                        Icons.edit,
                        color: active,
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(UserProductsScreen.routeName);
                      },
                    ),
                  ),
                  _buildDivider(),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: ListTile(
                      title: Text(
                        "Logout",
                        style: tStyle,
                      ),
                      leading: Icon(
                        Icons.exit_to_app,
                        color: active,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                    ),
                  ),
                  _buildDivider(),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: ListTile(
                      title: Text(
                        "About",
                        style: tStyle,
                      ),
                      leading: Icon(
                        Icons.info,
                        color: active,
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(About.routeName);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
