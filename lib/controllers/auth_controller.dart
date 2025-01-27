import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/user_data.dart';
import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/utilities/constants.dart';
import 'package:e_commerce/utilities/enums.dart';
import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;
  AuthFormType authFormType;
  final database = FireStoreDatabase("1234");

  AuthController(
      {required this.auth,
      this.email = '',
      this.password = '',
      this.authFormType = AuthFormType.login});
  Future<void> submit() async {
    try {
      if (authFormType == AuthFormType.login) {
        await auth.loginWithEmailAndPassword(email, password);
      } else {
        var user = await auth.SignUpWithEmailAndPasswored(email, password);
        await database.setUserData(UserData(
            uid: user == null ? documentIdFromLocalData() : user.uid,
            email: email));
      }
    } catch (e) {
      rethrow;
    }
  }

  void toggleFormType() {
    final formType = authFormType == AuthFormType.login
        ? AuthFormType.register
        : AuthFormType.login;
    email = '';
    password = '';
    copyWith(authFormType: formType);
  }

  void updatEmail(String email) => copyWith(email: email);
  void updatPassword(String password) => copyWith(password: password);
  void copyWith({String? email, String? password, AuthFormType? authFormType}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.authFormType = authFormType ?? this.authFormType;
    notifyListeners();
  }
}
