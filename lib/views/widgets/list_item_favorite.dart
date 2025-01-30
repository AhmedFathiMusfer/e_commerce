import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ListItemFavorite extends StatefulWidget {
  ListItemFavorite({required this.product, super.key});
  final Product product;
  @override
  _ListItemFavoriteState createState() => _ListItemFavoriteState();
}

class _ListItemFavoriteState extends State<ListItemFavorite> {
  bool favorite = true;
  @override
  Widget build(BuildContext context) {
//final size = MediaQuery.of(context).size;
    final database = Provider.of<Database>(context);

    return SizedBox(
      height: 500,
      child: InkWell(
        onTap: () async {
          await Navigator.of(context, rootNavigator: true).pushNamed(
              AppRoutes.ProductDetailRoutes,
              arguments: Map<String, dynamic>.from({
                'product': widget.product,
                'database': database,
                "Isfavorite": favorite
              }));
          // Isfavorite(database);
          //setState(() {});
        },
        child: Column(
          children: [
            Stack(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: CachedNetworkImage(
                        imageUrl: widget.product.imagUrl,
                        fit: BoxFit.cover,
                        width: 150,
                        height: 150,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ), // أثناء التحميل
                        errorWidget: (context, url, error) => Icon(Icons.error),
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
                                  '${widget.product.discountValue == 0 ? 0 : widget.product.discountValue}%',
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
                    left: 110,
                    bottom: 10,
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
                          child: favorite == true
                              ? Icon(Icons.favorite, color: Colors.redAccent)
                              : Icon(Icons.favorite_border_outlined),
                          onTap: () {
                            if (favorite) {
                              database.removeFromeFavorite(widget.product);
                            } else {
                              database.addToFavorite(widget.product);
                            }
                          },
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
