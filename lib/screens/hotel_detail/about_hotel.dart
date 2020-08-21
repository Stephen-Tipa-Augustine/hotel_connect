import 'package:flutter/material.dart';
import 'package:hotel_connect/models/hotel_list.dart';
import 'package:hotel_connect/services/load_image_storage.dart';
import 'package:hotel_connect/shared/constants.dart';
import 'package:provider/provider.dart';

class AboutHotelPage extends StatefulWidget {
  final HotelList item;
  AboutHotelPage({this.item});
  @override
  _AboutHotelPageState createState() => _AboutHotelPageState();
}

class _AboutHotelPageState extends State<AboutHotelPage> {
  @override
  Widget build(BuildContext context) {
    final hotelDetail = Provider.of<HotelList>(context) ??
        HotelList(
          location: '',
          overview: '',
          name: '',
          logo: '',
        );
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromRGBO(1, 89, 99, 1.0), Colors.redAccent[100]],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: ListView(
        children: <Widget>[
          GridView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            children: <Widget>[
              GetImageFromFirebase(
                filePath: 'hotel_list/logo1.png',
              ),
              GetImageFromFirebase(
                filePath: 'hotel_list/logo1.png',
              ),
              GetImageFromFirebase(
                filePath: 'hotel_list/logo1.png',
              ),
            ],
          ),
          Card(
            color: Colors.pink[100],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Location',
                  style: heading1TextStyle,
                ),
                Text(
                  hotelDetail.location,
                  style: bodyTextStyle,
                ),
              ],
            ),
          ),
          Card(
            color: Colors.pink[100],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'About',
                  style: heading1TextStyle,
                ),
                Text(
                  hotelDetail.overview,
                  style: bodyTextStyle,
                ),
              ],
            ),
          ),
          Card(
            color: Colors.pink[100],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Products and Services',
                  style: heading1TextStyle,
                ),
                Text(
                  hotelDetail.location,
                  style: bodyTextStyle,
                ),
              ],
            ),
          ),
          Card(
            color: Colors.pink[100],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Working Hours',
                  style: heading1TextStyle,
                ),
                Text(
                  hotelDetail.location,
                  style: bodyTextStyle,
                ),
              ],
            ),
          ),
          Card(
            color: Colors.pink[100],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Other Branches',
                  style: heading1TextStyle,
                ),
                Text(
                  hotelDetail.location,
                  style: bodyTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
