import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  MainButton(this.text, this.onTap, {this.hasRadius = true, super.key});
  final String text;
  final VoidCallback onTap;
  final bool hasRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(hasRadius == true ? 20 : 5),
              )),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headlineSmall,
          )),
    );
  }
}
