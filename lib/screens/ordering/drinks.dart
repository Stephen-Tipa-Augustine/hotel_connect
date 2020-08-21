import 'package:flutter/material.dart';
import 'package:hotel_connect/services/database.dart';
import 'package:hotel_connect/shared/constants.dart';
import 'package:hotel_connect/shared/loader_widget.dart';
import 'package:provider/provider.dart';
import 'package:hotel_connect/models/user_model.dart';

class DrinksOrder extends StatefulWidget {
  @override
  _DrinksOrderState createState() => _DrinksOrderState();
}

class _DrinksOrderState extends State<DrinksOrder> {
  final _formKey = GlobalKey<FormState>();
  List orders = [];
  bool ordered = false;
  bool loading = false;
  final choices = {
    'soda': ['1', '2', '3', '4'],
    'smallWater': ['1', '2', '3', '4'],
    'bigWater': ['1', '2', '3', '4'],
    'juice': ['1', '2', '3', '4'],
  };
  var soda = {
    'qty': '1',
    'selected': false,
    'name': 'soda',
    'price': '2000',
    'paid': 'off',
  };
  var smallWater = {
    'qty': '1',
    'selected': false,
    'name': 'smallWater',
    'price': '1000',
    'paid': 'off',
  };
  var bigWater = {
    'qty': '1',
    'selected': false,
    'name': 'bigWater',
    'price': '2000',
    'paid': 'off',
  };
  var juice = {
    'qty': '1',
    'selected': false,
    'name': 'juice',
    'price': '1500',
    'paid': 'off',
  };

  void makeOrder() {
    var items = [
      soda,
      smallWater,
      bigWater,
      juice,
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
                      Center(child: Text('Soda')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.soda['qty'],
                          items: this
                              .choices['soda']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.soda['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.soda['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.soda['selected'],
                            onChanged: (value) =>
                                setState(() => this.soda['selected'] = value)),
                      ),
                      // item two
                      Center(child: Text('Small Water')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.smallWater['qty'],
                          items: this
                              .choices['smallWater']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.smallWater['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.smallWater['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.smallWater['selected'],
                            onChanged: (value) => setState(
                                () => this.smallWater['selected'] = value)),
                      ),
                      // item three
                      Center(child: Text('Big Water')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.bigWater['qty'],
                          items: this
                              .choices['bigWater']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.bigWater['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.bigWater['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.bigWater['selected'],
                            onChanged: (value) => setState(
                                () => this.bigWater['selected'] = value)),
                      ),
                      // item four
                      Center(child: Text('Fruit Juice')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.juice['qty'],
                          items: this
                              .choices['juice']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.juice['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.juice['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.juice['selected'],
                            onChanged: (value) =>
                                setState(() => this.juice['selected'] = value)),
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
