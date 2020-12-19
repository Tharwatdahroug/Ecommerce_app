import 'package:ecommerce/providers/order.dart';
import 'package:ecommerce/widget/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class order_screen extends StatelessWidget {
  static const routeName = '/Order';
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(87, 87, 243, 1),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => order_item(orders.order_item[i]),
        itemCount: orders.order_item.length,
      ),
    );
  }
}
