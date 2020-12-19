import 'package:ecommerce/providers/product.dart';
import 'package:ecommerce/widget/drawer.dart';
import 'package:ecommerce/widget/user_Product_Item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './add_edit_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    //final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(87, 87, 243, 1),
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(add_edit_screen.routeName);
            },
          ),
        ],
      ),
      drawer: drawer(),
      body: Consumer<Products>(
        child: Center(
          child: const Text(' no product , start adding some!'),
        ),
        builder: (ctx, productsData, ch) => productsData.items.length <= 0
            ? ch
            : Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: productsData.items.length,
                  itemBuilder: (_, i) => Column(
                    children: [
                      UserProductItem(
                        productsData.items[i].id,
                        productsData.items[i].title,
                        productsData.items[i].image,
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
