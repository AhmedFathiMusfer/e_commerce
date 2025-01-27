import 'dart:ffi';

import 'package:e_commerce/controllers/auth_controller.dart';
import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/utilities/enums.dart';
import 'package:e_commerce/utilities/routes.dart';
import 'package:e_commerce/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _nameController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _passwordController = TextEditingController();
  final _passworedFocusNode = FocusNode();
  Future<void> _submit(AuthController model) async {
    try {
      await model.submit();
      if (!mounted) return;
      Navigator.of(context).pushNamed(AppRoutes.landingPageRoutes);
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Error!",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              content: Text(e.toString(),
                  style: Theme.of(context).textTheme.bodyLarge),
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
  // var _authType = AuthFormType.login;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(builder: (_, model, __) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 46.0, horizontal: 32.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      model.authFormType == AuthFormType.login
                          ? "login"
                          : "Register",
                      style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    onChanged: model.updatEmail,
                    onEditingComplete: () => {
                      model.authFormType == AuthFormType.register
                          ? FocusScope.of(context).requestFocus(_nameFocusNode)
                          : FocusScope.of(context)
                              .requestFocus(_passworedFocusNode)
                    },
                    textInputAction: TextInputAction.next,
                    validator: (val) =>
                        val!.isEmpty ? "please enter the UserName" : null,
                    decoration: InputDecoration(
                      label: Text("UserName"),
                      hintText: "Enter Your UserName",
                    ),
                  ),
                  if (model.authFormType == AuthFormType.register)
                    SizedBox(
                      height: 14,
                    ),
                  if (model.authFormType == AuthFormType.register)
                    TextFormField(
                      controller: _nameController,
                      focusNode: _nameFocusNode,
                      onEditingComplete: () => {
                        FocusScope.of(context).requestFocus(_passworedFocusNode)
                      },
                      textInputAction: TextInputAction.next,
                      validator: (val) =>
                          val!.isEmpty ? "please enter the Name" : null,
                      decoration: InputDecoration(
                        label: Text("Name"),
                        hintText: "Enter Your Name",
                      ),
                    ),
                  SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    focusNode: _passworedFocusNode,
                    onChanged: model.updatPassword,
                    validator: (val) =>
                        val!.isEmpty ? "Please enter the password" : null,
                    decoration: InputDecoration(
                      label: Text("Password"),
                      hintText: "Enter Your Password",
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  if (model.authFormType == AuthFormType.login)
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: Text("Forget your Passwored?"),
                        onTap: () => {},
                      ),
                    ),
                  SizedBox(
                    height: 14,
                  ),
                  MainButton(
                      model.authFormType == AuthFormType.login
                          ? "login"
                          : "Register", () {
                    setState(() {
                      if (_formkey.currentState!.validate()) {
                        _submit(model);
                      }
                    });
                    ;
                  }),
                  SizedBox(height: 13),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      child: Text(model.authFormType == AuthFormType.login
                          ? "Do not have an account?Register"
                          : "Do you have already an account?login"),
                      onTap: () => {
                        _formkey.currentState!.reset(),
                        model.toggleFormType()
                      },
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                        model.authFormType == AuthFormType.login
                            ? "OR login with"
                            : "OR register with",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.white),
                        child: Icon(Icons.add),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.white),
                        child: Icon(Icons.add),
                      )
                    ],
                  )
                ],
              ),
            ),
          )));
    });
  }
}
