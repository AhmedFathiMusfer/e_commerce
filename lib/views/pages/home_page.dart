import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utilities/assets.dart';
import 'package:e_commerce/views/widgets/list_item_home.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.network(
              AppAssets.topPannerHomePage,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Opacity(
              opacity: 0.4,
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
        SizedBox(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: dummyProducts
                .map((e) => Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListItemHome(product: e),
                    ))
                .toList(),
          ),
        ),
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
        SizedBox(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: dummyProducts
                .map((e) => Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListItemHome(product: e),
                    ))
                .toList(),
          ),
        )
      ],
    )));
  }
}
