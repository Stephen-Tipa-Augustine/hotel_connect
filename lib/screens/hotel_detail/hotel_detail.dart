import 'package:flutter/material.dart';
import 'package:hotel_connect/models/hotel_list.dart';
import 'package:hotel_connect/models/order_model.dart';
import 'package:hotel_connect/screens/events/events.dart';
import 'package:hotel_connect/screens/hotel_detail/about_hotel.dart';
import 'package:hotel_connect/screens/ordering/ordering.dart';
import 'package:hotel_connect/screens/payments/payment.dart';
import 'package:hotel_connect/screens/wrapper.dart';
import 'package:hotel_connect/models/user_profiles.dart';
import 'package:hotel_connect/services/auth_services.dart';
import 'package:hotel_connect/services/database.dart';
import 'package:hotel_connect/shared/constants.dart';
import 'package:provider/provider.dart';

class HotelDetail extends StatefulWidget {
  final UserProfile userProfileInfo;
  final String hotelName;
  final HotelList hotelItem;
  HotelDetail({this.hotelName, this.userProfileInfo, this.hotelItem});
  @override
  _HotelDetailState createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  Widget _currentView = AboutHotelPage();
  final AuthServices _authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<HotelList>.value(
      value: DatabaseService(hotelName: widget.hotelName).hoteldetail,
      child: StreamProvider<List<OrderModel>>.value(
        value: DatabaseService().orderLists,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Hotel Connect',
              style: TextStyle(color: Colors.white),
            ),
            elevation: 0.0,
            backgroundColor: Colors.redAccent[400],
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.home, color: Colors.blue),
                onPressed: () {
                  setState(() {
                    _currentView = AboutHotelPage(
                      item: widget.hotelItem,
                    );
                  });
                },
                color: Colors.blue,
              ),
              IconButton(
                icon: Icon(
                  Icons.event_note,
                  color: Colors.blue,
                ),
                onPressed: () {
                  setState(() {
                    _currentView = EventPage();
                  });
                },
                color: Colors.blue,
              ),
            ],
            bottom: PreferredSize(
                child: Container(
                  height: 20.0,
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome to ${widget.hotelName}',
                    style: heading5TextStyle.copyWith(color: Colors.blueAccent),
                  ),
                ),
                preferredSize: const Size.fromHeight(20.0)),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Available Options'),
                  decoration: BoxDecoration(color: Colors.pinkAccent),
                ),
                ListTile(
                  leading: Icon(
                    Icons.list,
                    color: Colors.purpleAccent,
                  ),
                  title: Text('Ordering'),
                  onTap: () {
                    setState(() {
                      _currentView = OrderingPage();
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.payment,
                    color: Colors.purpleAccent,
                  ),
                  title: Text('Payments'),
                  onTap: () {
                    setState(() {
                      _currentView = PaymentPage();
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.room_service,
                    color: Colors.purpleAccent,
                  ),
                  title: Text('Other Services'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.purpleAccent,
                  ),
                  title: Text('Go back to hotel List'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.purpleAccent,
                  ),
                  title: Text('Log out: ${widget.userProfileInfo.userName}'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    _authServices.signOut();
                  },
                ),
              ],
            ),
          ),
          body: Container(
            child: _currentView,
          ),
        ),
      ),
    );
  }
}
