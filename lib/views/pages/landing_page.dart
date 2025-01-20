import 'package:e_commerce/controllers/auth_controller.dart';
import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/views/pages/auth_page.dart';
import 'package:e_commerce/views/pages/bottom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User = snapshot.data;
            if (User == null) {
              return ChangeNotifierProvider<AuthController>(
                  create: (_) => AuthController(auth: auth), child: AuthPage());
            }
            return Provider<Database>(
                create: (_) => FireStoreDatabase(User.uid),
                child: BottomNavbar());
          }
          return Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        });
  }
}
