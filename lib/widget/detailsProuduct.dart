import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/providers/cart.dart';
import 'package:ecommerce/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screen/cart_screen.dart';
import '../contributor.dart';
import 'badge.dart';
import 'drawer.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = '/DetailsScreen';

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    int numOfItems = 1;
    final deviceSize = MediaQuery.of(context).size;
    final routeid = ModalRoute.of(context).settings.arguments as String;
    final product = Provider.of<Products>(context, listen: false)
        .items
        .firstWhere((pro) => pro.id == routeid);

    final cart = Provider.of<Cart>(context, listen: false);
    final mainColor = Color.fromRGBO(87, 87, 243, 1);
    return Scaffold(
      key: _key,
      drawer: drawer(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  // Container(
                  //   height: MediaQuery.of(context).size.height * 0.5,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: mainColor,
                  //       borderRadius: BorderRadius.only(
                  //         bottomLeft: const Radius.circular(70),
                  //         bottomRight: const Radius.circular(70),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 0, left: 0, right: 0, top: 30),
                    child: Container(
                      width: deviceSize.width,
                      height: deviceSize.height / 2,
                      child: Card(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.file(
                                product.image,
                                width: deviceSize.width,
                                height: deviceSize.height / 2,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: mainColor,
                          ),
                          onPressed: () {
                            _key.currentState.openDrawer();
                          },
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
                            color: mainColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                    Text("\$${product.price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      product.description,
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                          height: 32,
                          child: OutlineButton(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            onPressed: () {
                              if (numOfItems > 1) {
                                setState(() {
                                  numOfItems--;
                                });
                              }
                            },
                            child: Icon(Icons.remove, color: mainColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPaddin / 2),
                          child: Text(
                            // if our item is less  then 10 then  it shows 01 02 like that
                            numOfItems.toString().padLeft(2, "0"),
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 32,
                          child: OutlineButton(
                            color: mainColor,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            onPressed: () {
                              setState(() {
                                numOfItems++;
                              });
                            },
                            child: Icon(
                              Icons.add,
                              color: mainColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Container(
                    //   padding: EdgeInsets.all(0),
                    //   height: 38,
                    //   width: 38,
                    //   decoration: BoxDecoration(
                    //     color: Color(0xFFFF6464),
                    //     shape: BoxShape.circle,
                    //   ),
                    //   child: Consumer<Product>(
                    //     builder: (ctx, products, _) => IconButton(
                    //       icon: Icon(
                    //         products.isFavorite
                    //             ? Icons.favorite
                    //             : Icons.favorite_border,
                    //       ),
                    //       color: Colors.white,
                    //       onPressed: () {
                    //         products.toggleFavoriteStatus();
                    //       },
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: kDefaultPaddin),
                      height: 50,
                      width: 58,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: mainColor,
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add_shopping_cart,
                          color: mainColor,
                        ),
                        onPressed: () {
                          cart.additem(product.id, product.price, product.title,
                              product.image);
                        },
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          color: mainColor,
                          onPressed: () {
                            cart.additem(product.id, product.price,
                                product.title, product.image);
                          },
                          child: Text(
                            "Buy  Now".toUpperCase(),
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
      ),
    );
  }
}
