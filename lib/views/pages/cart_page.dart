import 'dart:math';

import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/utilities/routes.dart';
import 'package:e_commerce/views/widgets/cart_list_item.dart';
import 'package:e_commerce/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int totaPrice = 0;
  @override
  /*void didChangeDependencies() async {
    super.didChangeDependencies();
    final myCart = await Provider.of<Database>(context, listen: false)
        .myCartStream()
        .first;
    myCart.forEach((cart) {
      setState(() {
        totaPrice += cart.price * cart.quantity;
      });
    });
  }*/

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return SafeArea(
        child: StreamBuilder<List<Cart>>(
      stream: database.myCartStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final List<Cart> cartList = snapshot.data!;
          //TDDO:This is temporary
          totaPrice = 0;
          cartList.forEach(
            (element) => totaPrice += element.price * element.quantity,
          );
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox.shrink(),
                      IconButton(
                        icon: Icon(Icons.search_rounded),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'My Cart',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  if (cartList == null && cartList.isEmpty)
                    const Center(child: Text('No items in cart')),
                  ListView.builder(
                      itemCount: cartList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return CartListItem(cart: cartList[index]);
                      }),
                  SizedBox(
                    height: 24.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Price:",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.grey)),
                      Text("${totaPrice}\$",
                          style: Theme.of(context).textTheme.bodyLarge)
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MainButton("Check out", () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(AppRoutes.CheckoutPageRoutes);
                  }),
                  SizedBox(
                    height: 32.0,
                  )
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
