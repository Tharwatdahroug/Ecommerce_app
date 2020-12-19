import 'package:ecommerce/providers/cart.dart';
import 'package:ecommerce/providers/product.dart';
import 'package:ecommerce/screen/cart_screen.dart';
import 'package:ecommerce/screen/product_screen.dart';
import 'package:ecommerce/widget/Product.dart';
import 'package:ecommerce/widget/badge.dart';
import 'package:ecommerce/widget/card_last_home.dart';
import 'package:ecommerce/widget/cardhome.dart';
import 'package:ecommerce/widget/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/detailsProuduct.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final mainColor = Color.fromRGBO(87, 87, 243, 1);
    final Productdata = Provider.of<Products>(context);
    final products = Productdata.items;

    return Scaffold(
      key: _key,
      //  backgroundColor: Colors.white,
      drawerScrimColor: Colors.black,
      drawer: drawer(),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text(
      //     "Ecommerce",
      //     style: Theme.of(context).textTheme.headline6.copyWith(
      //           fontWeight: FontWeight.bold,
      //         ),
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.menu,
      //       color: Colors.black,
      //     ),
      //     onPressed: () {
      //       _key.currentState.openDrawer();
      //     },
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(
      //         Icons.search,
      //         size: 30,
      //       ),
      //       onPressed: () {},
      //       color: KTextColor,
      //     ),
      //     IconButton(
      //       icon: Icon(
      //         Icons.shopping_cart,
      //         size: 25,
      //       ),
      //       onPressed: () {},
      //       color: KTextColor,
      //     ),
      //     SizedBox(
      //       width: kDefaultPaddin / 20,
      //     ),
      //   ],
      // ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _key.currentState.openDrawer();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          size: 30,
                        ),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                      Consumer<Cart>(
                        builder: (_, cart, ch) => Badge(
                          child: ch,
                          value: cart.itemCount.toString(),
                          color: Colors.black,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.shopping_cart,
                            size: 25,
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(cartscreen.routeName);
                          },
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Image.network(
                          "https://c.top4top.io/p_18045nrfk1.png",
                          height: MediaQuery.of(context).size.height / 8.05,
                        ),
                      ),
                    ],
                  ),
                ),
                cardhome(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New Arrivals",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(product_screen.routeName);
                          },
                          color: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            "View All",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 260.0,
                    child: ListView.builder(
                      itemCount: products.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return ChangeNotifierProvider.value(
                          value: products[i],
                          child: card_lasthome(),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
//  Bodyhome()
// cardhome()
