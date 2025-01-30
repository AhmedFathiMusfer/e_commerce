import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utilities/constants.dart';
import 'package:e_commerce/views/widgets/dialog_without_buttom.dart';
import 'package:e_commerce/views/widgets/drop_down_menu.dart';
import 'package:e_commerce/views/widgets/main_button.dart';
import 'package:e_commerce/views/widgets/main_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  final Product product;
  bool Isfavorite = false;
  ProductDetail({required this.product, required this.Isfavorite});
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late String dropdownvalue;
  Future<void> _addToCart(Database database) async {
    try {
      await database.addToCart(Cart(
        id: documentIdFromLocalData(),
        productId: widget.product.id,
        title: widget.product.title,
        price: widget.product.price,
        imageUrl: widget.product.imagUrl,
        discountValue: widget.product.discountValue!,
        size: dropdownvalue,
      ));

      SuccessDialog().show(context);
    } catch (e) {
      MainDialog(title: "Error", content: e.toString()).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final database = Provider.of<Database>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 252, 252),
      appBar: AppBar(
        title: Text(
          widget.product.title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.product.imagUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: size.height * 0.5,
              placeholder: (context, url) =>
                  CircularProgressIndicator(), // أثناء التحميل
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: DropDownMenu(
                          onChanged: (value) {
                            setState(() {
                              dropdownvalue = value!;
                            });
                          },
                          items: ['S', 'M', 'L', 'XL'],
                          hint: 'Size',
                        )),
                        SizedBox(
                          width: 180.0,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                                onTap: () {
                                  if (widget.Isfavorite) {
                                    database
                                        .removeFromeFavorite(widget.product);
                                  } else {
                                    database.addToFavorite(widget.product);
                                  }
                                  setState(() {
                                    widget.Isfavorite = !widget.Isfavorite;
                                  });
                                },
                                child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: widget.Isfavorite == true
                                          ? Icon(Icons.favorite,
                                              color: Colors.redAccent)
                                          : Icon(
                                              Icons.favorite_border_outlined),
                                    ),
                                  ),
                                )))
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.product.title} ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '\$${widget.product.price} ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      widget.product.category,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.black45),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      "This is a dummy description for this product! i think we will add it in the future , Ineed to add more lines",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 24.0),
                    MainButton("Add to card", () {
                      _addToCart(database);
                    }),
                    SizedBox(height: 24.0),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
