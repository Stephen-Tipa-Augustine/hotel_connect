import 'package:flutter/material.dart';
import 'package:hotel_connect/models/hotel_list.dart';
import 'package:hotel_connect/models/user_profiles.dart';
import 'package:hotel_connect/screens/home/hotel_items.dart';

class DataSearch extends SearchDelegate<String> {
  final List<HotelList> hotelList;
  final UserProfile userProfileInfo;

  DataSearch({this.hotelList, this.userProfileInfo});

  @override
  List<Widget> buildActions(BuildContext context) {
    //Actions for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    final suggestionList = hotelList;

    return ListView.builder(
        itemExtent: 42.5,
        controller: ScrollController(
            debugLabel: 'Controller', initialScrollOffset: 10.0),
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return HotelItem(
            item: suggestionList[index],
            userProfileInfo: this.userProfileInfo,
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something

    final suggestionList = query.isEmpty
        ? hotelList
        : hotelList
            .where((p) => p.name.contains(RegExp(query, caseSensitive: false)))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Detail(
                item: suggestionList[index],
                userProfileInfo: this.userProfileInfo,
              ),
            ),
          );
        },
        trailing: Icon(Icons.remove_red_eye),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].name.substring(0, query.length),
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].name.substring(query.length),
                    style: TextStyle(color: Colors.grey)),
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}

class Detail extends StatelessWidget {
  final UserProfile userProfileInfo;
  final HotelList item;

  Detail({Key key, @required this.item, @required this.userProfileInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: const Text('Your Search Results',
              style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Center(
          child: HotelItem(
            item: item,
            userProfileInfo: this.userProfileInfo,
          ),
        ));
  }
}
