import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/utilities/router.dart';
import 'package:e_commerce/utilities/routes.dart';
import 'package:e_commerce/views/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
        create: (_) => Auth(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme: TextTheme(headlineSmall: TextStyle(color: Colors.white)),
            scaffoldBackgroundColor: Colors.white, //0xFF5E5E5E5
            appBarTheme: AppBarTheme(
                color: Colors.white,
                iconTheme: IconThemeData(color: Colors.black)),
            primaryColor: Colors.black,
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: Theme.of(context).textTheme.labelLarge,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.red)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.red))),
            cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.white,
            ),
          ),
          onGenerateRoute: (settings) => onGenerate(settings),
          initialRoute: AppRoutes.landingPageRoutes,
        ));
  }
}
