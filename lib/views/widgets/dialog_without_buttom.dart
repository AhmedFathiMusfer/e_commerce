import 'package:flutter/material.dart';

class SuccessDialog {
  void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // منع الإغلاق عند الضغط خارج النافذة
      builder: (BuildContext context) {
        // تأخير الإغلاق بعد 2 ثانية
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop(); // إغلاق النافذة
        });

        return AlertDialog(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 25),
              SizedBox(width: 7),
              Text(
                "Successful! Add it to cart",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }
}
