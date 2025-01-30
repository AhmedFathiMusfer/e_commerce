import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utilities/assets.dart';
import 'package:e_commerce/views/widgets/list_item_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/AutoSlidingPageView.dart';

class HomePage extends StatelessWidget {
  Widget _buildHeaderOfList(BuildContext context,
      {required String title,
      required String description,
      VoidCallback? ontap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: ontap,
              child: Text(
                "View All",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            )
          ],
        ),
        Text(description)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            SizedBox(
                height: 300,
                child: StreamBuilder<List<Product>>(
                    stream: database.NewProductStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        final products = snapshot.data;
                        if (products == null || products.isEmpty) {
                          return Center(
                            child: Text("No there Products"),
                          );
                        }
                        return AutoSlidingPageView(
                          products: products,
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    })),
            Opacity(
              opacity: 0.3,
              child: Container(
                width: double.infinity,
                height: 300,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                "Street Clothes",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 24.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: _buildHeaderOfList(context,
              title: "Sale", description: "Super Summer Sale !!"),
        ),
        SizedBox(
          height: 8.0,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              height: 330,
              child: StreamBuilder<List<Product>>(
                  stream: database.SelesProductStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final products = snapshot.data;
                      if (products == null || products.isEmpty) {
                        return Center(
                          child: Text("No there Products"),
                        );
                      }
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: ListItemHome(product: products[index]),
                            );
                          });
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            )),
        SizedBox(
          height: 24.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: _buildHeaderOfList(context,
              title: "New", description: "Super Summer Sale !!"),
        ),
        SizedBox(
          height: 8.0,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              height: 330,
              child: StreamBuilder<List<Product>>(
                  stream: database.NewProductStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final products = snapshot.data;
                      if (products == null || products.isEmpty) {
                        return Center(
                          child: Text("No there Products"),
                        );
                      }
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: ListItemHome(product: products[index]),
                            );
                          });
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ))
      ],
    )));
  }
}
