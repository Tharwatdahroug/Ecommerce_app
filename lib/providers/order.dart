import 'package:ecommerce/providers/cart.dart';
import 'package:flutter/cupertino.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItam> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Order with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get order_item {
    return [..._orders];
  }

  void addOrder(List<CartItam> cartItam, double totel) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: totel,
        products: cartItam,
        dateTime: DateTime.now(),
      ),
    );
  }
}
