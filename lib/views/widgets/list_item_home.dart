import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utilities/assets.dart';
import 'package:e_commerce/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListItemHome extends StatelessWidget {
  ListItemHome({required this.product, super.key});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(),
      child: InkWell(
        onTap: () => {
          Navigator.of(context, rootNavigator: true)
              .pushNamed(AppRoutes.ProductDetailRoutes, arguments: product)
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    product.imagUrl,
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
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
                          padding: EdgeInsets.all(8.0),
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
        ),
      ),
    );
  }
}
