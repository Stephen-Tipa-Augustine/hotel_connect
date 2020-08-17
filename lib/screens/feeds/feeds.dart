import 'package:hotel_connect/services/auth_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final AuthServices _authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Firebase Demo'),
        elevation: 0.0,
        backgroundColor: Colors.brown[400],
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () => _authServices.signOut(),
              icon: Icon(Icons.account_circle),
              label: Text('Logout'))
        ],
      ),
    );
  }
}
