import 'package:flutter/material.dart';
import 'package:test_delete/models/product.dart';
import 'package:test_delete/pages/screens/detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product, required Null Function() onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(product: product),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Image.network(product.imageUrl),
            Text(product.name),
            Text('\$${product.price.toStringAsFixed(2)}'),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow),
                Text(product.rating.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
