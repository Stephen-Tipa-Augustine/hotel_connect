import 'package:hotel_connect/models/user_model.dart';
import 'package:hotel_connect/screens/auth/authentication.dart';
import 'package:hotel_connect/screens/feeds/feeds.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WrapperWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user == null ? Authentication() : HomePage();
  }
}
