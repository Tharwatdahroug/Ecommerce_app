import 'package:ecommerce/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screen/add_edit_screen.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final image;

  UserProductItem(this.id, this.title, this.image);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      leading: CircleAvatar(
        backgroundImage: FileImage(image),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(add_edit_screen.routeName, arguments: id);
              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Provider.of<Products>(context, listen: false).deleteProduct(id);
              },
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
