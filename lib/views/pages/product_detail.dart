import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  ProductDetail({required this.product});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              product.imagUrl,
              width: double.infinity,
              height: size.height * 0.4,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
