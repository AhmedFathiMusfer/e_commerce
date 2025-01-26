import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/views/widgets/main_button.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final Product product;
  ProductDetail({required this.product});
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool Isfavorite = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            Image.network(
              widget.product.imagUrl,
              width: double.infinity,
              height: size.height * 0.5,
              fit: BoxFit.cover,
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
                    Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                Isfavorite = !Isfavorite;
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
                                  child: Icon(Isfavorite == true
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined),
                                ),
                              ),
                            ))),
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
                    MainButton("Add to card", () => {}),
                    SizedBox(height: 24.0),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
