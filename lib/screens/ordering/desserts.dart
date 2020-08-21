import 'package:flutter/material.dart';
import 'package:hotel_connect/services/database.dart';
import 'package:hotel_connect/shared/constants.dart';
import 'package:hotel_connect/shared/loader_widget.dart';
import 'package:provider/provider.dart';
import 'package:hotel_connect/models/user_model.dart';

class DessertOrder extends StatefulWidget {
  @override
  _DessertOrderState createState() => _DessertOrderState();
}

class _DessertOrderState extends State<DessertOrder> {
  final _formKey = GlobalKey<FormState>();
  List orders = [];
  bool ordered = false;
  bool loading = false;
  final choices = {
    'iceCream': ['1', '2'],
    'cake': ['1', '2', '3'],
    'fruit': ['1', '2', '3', '4'],
  };
  var iceCream = {
    'qty': '1',
    'selected': false,
    'name': 'iceCream',
    'price': '2000',
    'paid': 'off',
  };
  var cake = {
    'qty': '1',
    'selected': false,
    'name': 'cake',
    'price': '3000',
    'paid': 'off',
  };
  var fruit = {
    'qty': '1',
    'selected': false,
    'name': 'fruit',
    'price': '1000',
    'paid': 'off',
  };

  void makeOrder() {
    var items = [
      iceCream,
      cake,
      fruit,
    ];
    for (var item in items) {
      if (item['selected']) {
        setState(() {
          this.orders.add(item);
        });
      }
    }
    print(this.orders);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return Container(
      child: this.ordered
          ? Center(
              child: this.loading
                  ? LoaderWidget1()
                  : Column(
                      children: [
                        Text('Orders recorded', style: heading4TextStyle),
                        Text(
                          'Complete by going to Payment Page',
                          style: bodyTextStyle.copyWith(
                              fontSize: 15, color: Colors.red),
                        ),
                      ],
                    ),
            )
          : Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Text(
                    'Make an order',
                    style: bodyTextStyle.copyWith(fontSize: 18),
                  ),
                  GridView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0),
                    children: <Widget>[
                      Text('Item'),
                      Text('Quantity'),
                      Text('Price/Quantiy'),
                      Text('Selection'),
                      // item one
                      Center(child: Text('Ice Cream')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.iceCream['qty'],
                          items: this
                              .choices['iceCream']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.iceCream['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.iceCream['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.iceCream['selected'],
                            onChanged: (value) => setState(
                                () => this.iceCream['selected'] = value)),
                      ),
                      // item two
                      Center(child: Text('Cake')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.cake['qty'],
                          items: this
                              .choices['cake']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.cake['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.cake['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.cake['selected'],
                            onChanged: (value) =>
                                setState(() => this.cake['selected'] = value)),
                      ),
                      // item three
                      Center(child: Text('Fruit')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.fruit['qty'],
                          items: this
                              .choices['fruit']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.fruit['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.fruit['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.fruit['selected'],
                            onChanged: (value) =>
                                setState(() => this.fruit['selected'] = value)),
                      ),
                    ],
                  ),
                  Center(
                    child: RaisedButton.icon(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            this.loading = true;
                            this.ordered = true;
                          });
                          this.makeOrder();
                          for (var item in this.orders) {
                            await DatabaseService(uid: user.uid)
                                .orderList(item);
                          }
                          setState(() {
                            this.loading = false;
                          });
                        }
                      },
                      icon: Icon(Icons.add_box, color: Colors.redAccent),
                      label: Text('Add to basket'),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
