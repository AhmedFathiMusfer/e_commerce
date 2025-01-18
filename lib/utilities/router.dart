import 'package:e_commerce/utilities/routes.dart';
import 'package:e_commerce/views/pages/bottom_navbar.dart';
import 'package:e_commerce/views/pages/home_page.dart';
import 'package:e_commerce/views/pages/landing_page.dart';
import 'package:e_commerce/views/pages/auth_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    default:
      return CupertinoPageRoute(
          builder: (_) => LandingPage(), settings: settings);
  }
}
