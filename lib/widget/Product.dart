import 'package:ecommerce/providers/product.dart';
import 'package:ecommerce/widget/ItemProduct.dart';
import 'package:ecommerce/widget/detailsProuduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../contributor.dart';

class Bodyhome extends StatelessWidget {
  final bool showFavs;

  Bodyhome(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final Productdata = Provider.of<Products>(context);
    final products = showFavs ? Productdata.favoriteItems : Productdata.items;
    ;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: kDefaultPaddin,
          crossAxisSpacing: 10,
          childAspectRatio: 0.55,
        ),
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: ItemProduct(),
        ),
      ),
    );
  }
}
