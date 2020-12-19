import 'dart:io';

import 'package:flutter/cupertino.dart';

class CartItam {
  final String id;
  final String title;
  final int quantity;
  final double pric;
  //final String imageUrl;
  final File image;
  CartItam({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.pric,
//    @required this.imageUrl,
    @required this.image,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItam> _item = {};

  Map<String, CartItam> get item_card {
    return {..._item};
  }

  int get itemCount {
    return _item.length;
  }

  double get totel {
    var totel = 0.0;
    _item.forEach((key, CartItam) {
      totel += CartItam.pric * CartItam.quantity;
    });
    return totel;
  }

  void removeItem(String productId) {
    _item.remove(productId);
    notifyListeners();
  }

  void additem(
    String productId,
    double price,
    String title,
    image,
  ) {
    if (_item.containsKey(productId)) {
      _item.update(
        productId,
        (value) => CartItam(
          id: value.id,
          title: value.title,
          quantity: value.quantity + 1,
          pric: value.pric,
          //imageUrl: value.imageUrl,
          image: value.image,
        ),
      );
    } else {
      _item.putIfAbsent(
        productId,
        () => CartItam(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          pric: price,
          //imageUrl: imageUrl,
          image: image,
        ),
      );
      notifyListeners();
    }
  }

  void ramovSingleitem(String productId) {
    if (!_item.containsKey(productId)) {
      return;
    }
    if (_item[productId].quantity > 1) {
      _item.update(
        productId,
        (value) => CartItam(
          id: value.id,
          title: value.title,
          quantity: value.quantity - 1,
          pric: value.pric,
          //imageUrl: value.imageUrl,
          image: value.image,
        ),
      );
    } else {
      _item.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _item = {};
    notifyListeners();
  }
}
