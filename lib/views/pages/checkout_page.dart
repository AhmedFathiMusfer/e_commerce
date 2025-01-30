import 'package:e_commerce/views/widgets/shopping_address_component.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shopping Address",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                ShoppingAddressComponent(),
                Text(
                  "Payment",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  "",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          )),
    );
  }
}
