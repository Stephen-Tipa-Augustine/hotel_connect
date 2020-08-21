import 'package:hotel_connect/models/hotel_list.dart';
import 'package:hotel_connect/models/user_model.dart';
import 'package:hotel_connect/models/user_profiles.dart';
import 'package:hotel_connect/screens/auth/authentication.dart';
import 'package:hotel_connect/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hotel_connect/services/database.dart';
import 'package:provider/provider.dart';

class WrapperWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return user == null
        ? Authentication()
        : StreamProvider<UserProfile>.value(
            value: DatabaseService(uid: user.uid).userProfileInfo,
            child: StreamProvider<List<HotelList>>.value(
                value: DatabaseService().hotelLists, child: HomePage()));
  }
}
