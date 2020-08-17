import 'package:hotel_connect/models/user_model.dart';
import 'package:hotel_connect/screens/wrapper.dart';
import 'package:hotel_connect/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthServices().user,
      child: MaterialApp(
        home: WrapperWidget(),
      ),
    );
  }
}
