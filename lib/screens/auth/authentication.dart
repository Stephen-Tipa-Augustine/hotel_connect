import 'package:hotel_connect/screens/auth/register.dart';
import 'package:hotel_connect/screens/auth/sign_in.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool showSignInPage = true;
  void toggleAuthView() => setState(() => showSignInPage = !showSignInPage);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: showSignInPage
          ? SignInPage(
              toggleView: this.toggleAuthView,
            )
          : Register(
              toggleView: this.toggleAuthView,
            ),
    );
  }
}
