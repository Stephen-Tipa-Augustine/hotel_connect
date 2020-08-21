import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_connect/models/hotel_list.dart';
import 'package:hotel_connect/models/order_model.dart';
import 'package:hotel_connect/models/user_profiles.dart';

class DatabaseService {
  // Reference to the hotel list collections
  final String uid;
  final String hotelName;
  final CollectionReference hotelListRef =
      Firestore.instance.collection('hotel_list');
  final CollectionReference userProfileRef =
      Firestore.instance.collection('user_profile');
  final CollectionReference orderListRef =
      Firestore.instance.collection('order_list');

  DatabaseService({this.uid, this.hotelName});

  Future hotelListInfo(
      String name, String location, String overview, String logo) async {}

  Future orderList(var item) async {
    var e = item;
    return await orderListRef
        .document(DateTime.now().toString() + e['name'])
        .setData({
      'author_uid': uid,
      'name': e['name'],
      'qty': e['qty'],
      'price': e['price'],
      'paid': e['paid'],
    });
  }

  Future userProfile(
      {String email,
      String userName,
      String firstName,
      String lastName,
      String contact}) async {
    return await userProfileRef.document(uid).setData({
      'author_uid': uid,
      'email': email,
      "userName": userName,
      "firstName": firstName,
      "lastName": lastName,
      "contact": contact
    });
  }

  UserProfile _userProfile(QuerySnapshot snapshot) {
    var result;
    for (var doc in snapshot.documents) {
      if (doc.data['author_uid'] == uid) {
        result = UserProfile(
          email: doc.data['email'] ?? 'None',
          userName: doc.data['userName'] ?? 'Unknown',
          firstName: doc.data['firstName'] ?? 'Unknown',
          lastName: doc.data['lastName'] ?? 'Unknown',
          contact: doc.data['contact'] ?? 'Unknown',
        );
      }
    }
    return result;
  }

  // Get a snapshot of the user profile data
  Stream<UserProfile> get userProfileInfo {
    return userProfileRef.snapshots().map((event) => _userProfile(event));
  }

  // Get a snapshot of hotel lists
  Stream<List<HotelList>> get hotelLists {
    return hotelListRef
        .snapshots()
        .map((event) => _hotelListFromSnapshots(event));
  }

  //Get a snapshot of a particular hotel
  Stream<HotelList> get hoteldetail {
    return hotelListRef
        .snapshots()
        .map((event) => _hotelItemFromSnapshots(event));
  }

  // Custom hotel detail class
  HotelList _hotelItemFromSnapshots(QuerySnapshot snapshot) {
    var doc = snapshot.documents
        .firstWhere((element) => element.data['name'] == this.hotelName);
    return HotelList(
      name: doc.data['name'],
      location: doc.data['location'],
      overview: doc.data['overview'],
      logo: doc.data['logo'],
    );
  }

  // return list of oders
  List<OrderModel> _orderListFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return OrderModel.breakFast(
        name: doc.data['name'],
        qty: doc.data['qty'],
        price: doc.data['price'],
        paid: doc.data['paid'],
        author_uid: doc.data['author_uid'],
      );
    }).toList();
  }

  // Get a snapshot of order lists
  Stream<List<OrderModel>> get orderLists {
    return orderListRef
        .snapshots()
        .map((event) => _orderListFromSnapshots(event));
  }

  // Custom hotel list stream data
  List<HotelList> _hotelListFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return HotelList(
        name: doc.data['name'],
        location: doc.data['location'],
        overview: doc.data['overview'],
        logo: doc.data['logo'],
      );
    }).toList();
  }
}
