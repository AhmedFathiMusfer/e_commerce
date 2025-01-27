import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utilities/assets.dart';
import 'package:e_commerce/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ListItemHome extends StatelessWidget {
  ListItemHome({required this.product, super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final database = Provider.of<Database>(context);
    return InkWell(
      onTap: () => {
        Navigator.of(context, rootNavigator: true).pushNamed(
            AppRoutes.ProductDetailRoutes,
            arguments: Map<String, dynamic>.from(
                {'product': product, 'database': database}))
      },
      child: Stack(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  product.imagUrl,
                  fit: BoxFit.cover,
                  width: 180,
                  height: 180,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 30,
                  width: 50,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.black),
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Center(
                          child: Text(
                            '${product.discountValue == 0 ? 0 : product.discountValue}%',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      )),
                ),
              )
            ],
          ),
          Positioned(
              left: size.width * 0.38,
              bottom: size.height * 0.19,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: InkWell(
                    child: Icon(
                      Icons.favorite_border,
                      size: 20,
                      color: Colors.grey,
                    ),
                    onTap: () {},
                  ),
                ),
              )),
          Positioned(
              bottom: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: product.rate ?? 4.0,
                        itemSize: 25.0,
                        direction: Axis.horizontal,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        '(100)',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    product.category,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    product.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '${product.price}\$',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
