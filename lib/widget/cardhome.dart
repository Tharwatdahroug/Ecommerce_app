import 'package:ecommerce/providers/product.dart';
import 'package:ecommerce/widget/carditemhome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class cardhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Productdata = Provider.of<Products>(context);
    final products = Productdata.items;

    return Padding(
      padding: const EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 120),
      child: SizedBox(
        width: size.width,
        height: 200,
        child: Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Swiper(
            itemCount: products.length,
            autoplay: true,
            pagination: SwiperPagination(margin: EdgeInsets.all(10)),
            itemBuilder: (context, i) {
              return ChangeNotifierProvider.value(
                value: products[i],
                child: carditemhome(),
              );
            },
          ),
        ),
      ),
    );
  }
}
