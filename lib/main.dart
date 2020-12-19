import 'package:ecommerce/providers/cart.dart';
import 'package:ecommerce/providers/order.dart';
import 'package:ecommerce/providers/product.dart';
import 'package:ecommerce/screen/about.dart';
import 'package:ecommerce/screen/add_edit_screen.dart';
import 'package:ecommerce/screen/auth_screen.dart';
import 'package:ecommerce/screen/cart_screen.dart';
import 'package:ecommerce/screen/home.dart';
import 'package:ecommerce/screen/login.dart';
import 'package:ecommerce/screen/order_screen.dart';
import 'package:ecommerce/screen/product_screen.dart';
import 'package:ecommerce/screen/signup.dart';
import 'package:ecommerce/screen/use_product_screen.dart';
import 'package:ecommerce/widget/detailsProuduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Order(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Auth(),
        routes: {
          login.routeName: (ctx) => login(),
          sigup.routeName: (ctx) => sigup(),
          Home.routeName: (ctx) => Home(),
          DetailsScreen.routeName: (ctx) => DetailsScreen(),
          cartscreen.routeName: (ctx) => cartscreen(),
          order_screen.routeName: (ctx) => order_screen(),
          product_screen.routeName: (ctx) => product_screen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          About.routeName: (ctx) => About(),
          add_edit_screen.routeName: (ctx) => add_edit_screen(),
        },
      ),
    );
  }
}
