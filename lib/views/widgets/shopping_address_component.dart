import 'package:flutter/material.dart';

class ShoppingAddressComponent extends StatelessWidget {
  ShoppingAddressComponent();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ahmed Musfer",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w600)),
                  InkWell(
                      onTap: () => {},
                      child: Text(
                        "Change",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.blue),
                      ))
                ],
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(
                "13 marbe street",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                "sanaa",
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          )),
    );
  }
}
