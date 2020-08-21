import 'package:flutter/material.dart';
import 'package:hotel_connect/services/database.dart';
import 'package:hotel_connect/shared/constants.dart';
import 'package:hotel_connect/shared/loader_widget.dart';
import 'package:provider/provider.dart';
import 'package:hotel_connect/models/user_model.dart';

class MealOrder extends StatefulWidget {
  @override
  _MealOrderState createState() => _MealOrderState();
}

class _MealOrderState extends State<MealOrder> {
  final _formKey = GlobalKey<FormState>();
  List orders = [];
  bool ordered = false;
  bool loading = false;
  final choices = {
    'chicken': ['1', '2', '3'],
    'liver': ['1', '2', '3'],
    'beef': ['1', '2', '3'],
    'freshFish': ['1', '2', '3'],
    'dryFish': ['1', '2', '3'],
    'beans': ['1', '2', '3'],
  };
  var chicken = {
    'qty': '1',
    'selected': false,
    'name': 'chicken',
    'price': '10000',
    'paid': 'off',
  };
  var liver = {
    'qty': '1',
    'selected': false,
    'name': 'liver',
    'price': '8000',
    'paid': 'off',
  };
  var beef = {
    'qty': '1',
    'selected': false,
    'name': 'beef',
    'price': '7000',
    'paid': 'off',
  };
  var freshFish = {
    'qty': '1',
    'selected': false,
    'name': 'freshFish',
    'price': '8000',
    'paid': 'off',
  };
  var dryFish = {
    'qty': '1',
    'selected': false,
    'name': 'dryFish',
    'price': '8000',
    'paid': 'off',
  };

  void makeOrder() {
    var items = [
      chicken,
      liver,
      beef,
      freshFish,
      dryFish,
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
                      Center(child: Text('Chicken')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.chicken['qty'],
                          items: this
                              .choices['chicken']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.chicken['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.chicken['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.chicken['selected'],
                            onChanged: (value) => setState(
                                () => this.chicken['selected'] = value)),
                      ),
                      // item two
                      Center(child: Text('Liver')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.liver['qty'],
                          items: this
                              .choices['liver']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.liver['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.liver['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.liver['selected'],
                            onChanged: (value) =>
                                setState(() => this.liver['selected'] = value)),
                      ),
                      // item three
                      Center(child: Text('Beef')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.beef['qty'],
                          items: this
                              .choices['beef']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.beef['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.beef['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.beef['selected'],
                            onChanged: (value) =>
                                setState(() => this.beef['selected'] = value)),
                      ),
                      // item four
                      Center(child: Text('Fresh Fish')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.freshFish['qty'],
                          items: this
                              .choices['freshFish']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.freshFish['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.freshFish['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.freshFish['selected'],
                            onChanged: (value) => setState(
                                () => this.freshFish['selected'] = value)),
                      ),
                      // item five
                      Center(child: Text('Dry Fish')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.dryFish['qty'],
                          items: this
                              .choices['dryFish']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.dryFish['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.dryFish['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.dryFish['selected'],
                            onChanged: (value) => setState(
                                () => this.dryFish['selected'] = value)),
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
