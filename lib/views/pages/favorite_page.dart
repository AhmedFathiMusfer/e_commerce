import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/views/widgets/list_item_favorite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: StreamBuilder<List<Product>>(
              stream: database.getFavorite(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  final products = snapshot.data;
                  if (products == null || products.isEmpty) {
                    return Center(
                      child: Text("No there Products"),
                    );
                  }
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0.8,
                          mainAxisSpacing: 0.8),
                      itemCount: products.length,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListItemFavorite(product: products[index]),
                        );
                      });
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }
}
