import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartListItem extends StatelessWidget {
  final Cart cart;
  CartListItem({required this.cart});
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return SizedBox(
        height: 110,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    child: CachedNetworkImage(
                      imageUrl: cart.imageUrl,
                      fit: BoxFit.cover,
                      width: 110,
                      height: 110,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ), // أثناء التحميل
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cart.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600)),
                              Row(
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "Color:",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: Colors.grey),
                                        ),
                                        TextSpan(
                                          text: cart.color,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 6.0),
                                  Text.rich(
                                    TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "Size:",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: Colors.grey),
                                        ),
                                        TextSpan(
                                          text: cart.size,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor:
                                        const Color.fromRGBO(226, 226, 226, 1),
                                    child: InkWell(
                                      child: Icon(
                                        Icons.add,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                      onTap: () {
                                        cart.quantity++;
                                        database.updateCart(cart);
                                      },
                                    ),
                                  ),
                                  Text("${cart.quantity}"),
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor:
                                        const Color.fromRGBO(226, 226, 226, 1),
                                    child: InkWell(
                                      child: Icon(
                                        Icons.remove,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                      onTap: () {
                                        cart.quantity--;
                                        database.updateCart(cart);
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ))),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.more_vert_outlined),
                          Text(
                            "${cart.price * cart.quantity}\$",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      )),
                ])));
  }
}
