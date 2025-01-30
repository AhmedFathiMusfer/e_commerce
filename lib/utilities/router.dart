import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utilities/routes.dart';
import 'package:e_commerce/views/pages/bottom_navbar.dart';
import 'package:e_commerce/views/pages/checkout_page.dart';
import 'package:e_commerce/views/pages/home_page.dart';
import 'package:e_commerce/views/pages/landing_page.dart';
import 'package:e_commerce/views/pages/auth_page.dart';
import 'package:e_commerce/views/pages/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginpPageRoutes:
      return CupertinoPageRoute(builder: (_) => AuthPage(), settings: settings);
    case AppRoutes.homePageRoutes:
      return CupertinoPageRoute(builder: (_) => HomePage(), settings: settings);
    case AppRoutes.bottomNavbarRoutes:
      return CupertinoPageRoute(
          builder: (_) => BottomNavbar(), settings: settings);
    case AppRoutes.landingPageRoutes:
      return CupertinoPageRoute(
          builder: (_) => LandingPage(), settings: settings);
    case AppRoutes.ProductDetailRoutes:
      final args = settings.arguments as Map<String, dynamic>;
      final product = args['product'];
      final database = args['database'];
      final Isfavorite = args['Isfavorite'];
      return CupertinoPageRoute(
          builder: (_) => Provider<Database>.value(
                value: database,
                child: ProductDetail(
                  product: product as Product,
                  Isfavorite: Isfavorite as bool,
                ),
              ),
          settings: settings);
    case AppRoutes.CheckoutPageRoutes:
      return CupertinoPageRoute(
          builder: (_) => CheckoutPage(), settings: settings);

    default:
      return CupertinoPageRoute(
          builder: (_) => LandingPage(), settings: settings);
  }
}
