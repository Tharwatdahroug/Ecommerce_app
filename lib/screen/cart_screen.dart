import 'package:ecommerce/providers/cart.dart';
import 'package:ecommerce/providers/order.dart';
import 'package:ecommerce/widget/cart_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../contributor.dart';

class cartscreen extends StatelessWidget {
  static const routeName = '/Cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final order = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(87, 87, 243, 1),
        title: Text('Your Cart'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, i) => cartitem(
                cart.item_card.values.toList()[i].id,
                cart.item_card.keys.toList()[i],
                cart.item_card.values.toList()[i].pric,
                cart.item_card.values.toList()[i].quantity,
                cart.item_card.values.toList()[i].title,
                cart.item_card.values.toList()[i].image
                // cart.item_card.values.toList()[i].imageUrl,
                ),
            itemCount: cart.item_card.length,
          )),
          Card(
            margin: EdgeInsets.all(0),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 18, color: kTextLightColor),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totel.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Color.fromRGBO(87, 87, 243, 1),
                  ),
                  Spacer(),
                  RaisedButton(
                    color: Color.fromRGBO(87, 87, 243, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'ORDER NOW',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      order.addOrder(
                          cart.item_card.values.toList(), cart.totel);
                      cart.clear();
                    },
                    textColor: Color.fromRGBO(87, 87, 243, 1),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
