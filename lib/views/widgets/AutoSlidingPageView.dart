import 'dart:async';
import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';

class AutoSlidingPageView extends StatefulWidget {
  final List<Product> products;
  AutoSlidingPageView({required this.products});
  @override
  _AutoSlidingPageViewState createState() => _AutoSlidingPageViewState();
}

class _AutoSlidingPageViewState extends State<AutoSlidingPageView> {
  final PageController _pageController = PageController();

  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // بدء المؤقت لتغيير الصفحة كل ثانيتين
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < widget.products.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // إلغاء المؤقت عند التخلص من الـ Widget
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        return Image.network(
          widget.products[index].imagUrl,
          fit: BoxFit.cover,
          height: 150,
          width: double.infinity,
        );
      },
    );
  }
}
