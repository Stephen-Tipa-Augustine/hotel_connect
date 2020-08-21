import 'package:flutter/material.dart';
import 'package:hotel_connect/models/hotel_list.dart';
import 'package:hotel_connect/models/user_profiles.dart';
import 'package:hotel_connect/screens/home/hotel_items.dart';
import 'package:hotel_connect/screens/home/searchBar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final userProfileInfo = Provider.of<UserProfile>(context) ?? UserProfile();
    final hotelList = Provider.of<List<HotelList>>(context) ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hotels Around K'la",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: DataSearch(
                        hotelList: hotelList,
                        userProfileInfo: userProfileInfo));
              })
        ],
        bottom: PreferredSize(
            child: Container(
              height: 20.0,
              alignment: Alignment.center,
              child: Text('check this out ${userProfileInfo.userName}'),
            ),
            preferredSize: const Size.fromHeight(20.0)),
        elevation: 0.0,
        backgroundColor: Colors.redAccent[400],
      ),
      body: Container(
        //decoration: BoxDecoration(
        //  image: DecorationImage(
        //    image: AssetImage("assets/images/background1.jpeg"),
        //  fit: BoxFit.cover)),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(1, 89, 99, 1.0), Colors.redAccent[100]],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        child: ListView.builder(
            controller: ScrollController(
                debugLabel: 'Controller', initialScrollOffset: 10.0),
            itemCount: hotelList.length,
            itemBuilder: (context, index) {
              return HotelItem(
                item: hotelList[index],
                userProfileInfo: userProfileInfo,
              );
            }),
      ),
    );
  }
}
