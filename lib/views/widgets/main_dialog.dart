import 'package:flutter/material.dart';

class MainDialog {
  final String title;
  final String content;
  MainDialog({required this.title, required this.content});
  void show(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            content:
                Text(content, style: Theme.of(context).textTheme.bodyLarge),
            actions: [
              TextButton(
                  onPressed: () => {Navigator.of(context).pop()},
                  child: Text(
                    'Ok',
                    style: Theme.of(context).textTheme.labelLarge,
                  ))
            ],
          );
        });
  }
}
