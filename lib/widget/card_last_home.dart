import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/providers/product.dart';
import 'package:ecommerce/widget/detailsProuduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class card_lasthome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailsScreen.routeName, arguments: product.id);
      },
      child: Card(
        elevation: 0,
        margin: EdgeInsets.only(right: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 8),
          child: Column(
            children: [
              Container(
                width: 140.0,
                height: 150.0,
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(
                  top: 0,
                  right: 0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: FileImage(product.image),
                    //image: NetworkImage(
                    // product.imageUrl,
                    // ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Consumer<Product>(
                  builder: (ctx, product, _) => IconButton(
                    icon: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    color: Colors.white,
                    onPressed: () {
                      product.toggleFavoriteStatus();
                    },
                  ),
                ),
              ),
              SizedBox(height: 12),
              Expanded(
                child: SizedBox(
                  width: 145.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        product.description,
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        "\$${product.price}",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
