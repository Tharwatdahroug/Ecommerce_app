import 'dart:io';

import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  //final String imageUrl;
  bool isFavorite;
  final File image;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    // @required this.imageUrl,
    this.isFavorite = false,
    @required this.image,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
