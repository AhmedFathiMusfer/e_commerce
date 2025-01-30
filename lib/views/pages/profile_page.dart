import 'package:e_commerce/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => {auth.logout()}, icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text("Not availbil now"),
      ),
    );
  }
}
