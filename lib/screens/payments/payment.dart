import 'package:flutter/material.dart';
import 'package:hotel_connect/models/order_model.dart';
import 'package:hotel_connect/models/user_model.dart';
import 'package:hotel_connect/shared/constants.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  double totalAmount = 0.0;
  var ordersUnPaid = [];
  void orders(List<OrderModel> items, UserModel user) {
    var itemsDemo = [];
    for (var item in items) {
      if (item.paid == 'off' && item.author_uid == user.uid) {
        setState(() {
          totalAmount += double.tryParse(item.price) ?? 0.0;
          itemsDemo.add([item.name, item.qty, item.price + '/=']);
        });
      }
    }
    for (List item in itemsDemo) {
      for (var e in item) {
        this.ordersUnPaid.add(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<List<OrderModel>>(context) ?? [];
    final user = Provider.of<UserModel>(context);

    return Container(
      margin: EdgeInsets.only(bottom: 40.0),
      child: ListView(
        children: [
          SizedBox(
            height: 100,
            child: Card(
              elevation: 0.0,
              color: Colors.redAccent[100],
              child: Center(
                child: Text(
                  'Click on the below button to see payments',
                  style: bodyTextStyle.copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              color: Colors.pink,
              child: RaisedButton.icon(
                  onPressed: () => orders(orderList, user),
                  icon: Icon(
                    Icons.view_list,
                    color: Colors.red,
                  ),
                  label: Text(
                    'See list',
                    style: TextStyle(color: Colors.blue),
                  )),
            ),
          ),
          GridView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            children: <Widget>[
              Center(
                child: Text('Item'),
              ),
              Center(
                child: Text('Quantity'),
              ),
              Center(
                child: Text('Price/Item'),
              ),
              ...this.ordersUnPaid.map(
                    (e) => Center(
                      child: Text(e),
                    ),
                  ),
            ],
          ),
          GridView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 4.0),
            children: <Widget>[
              Center(
                child: Text('Total Amount'),
              ),
              Center(
                child: Text('$totalAmount /='),
              ),
            ],
          ),
          Center(
            child: Container(
              color: Colors.pink,
              child: RaisedButton(
                onPressed: () {},
                child: Text('Pay Now'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
