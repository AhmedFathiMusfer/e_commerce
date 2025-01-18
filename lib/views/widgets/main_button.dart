import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  MainButton(this.text, this.onTap, {super.key});
  final String text;
  final VoidCallback onTap;
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
                borderRadius: BorderRadius.circular(20),
              )),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headlineSmall,
          )),
    );
  }
}
