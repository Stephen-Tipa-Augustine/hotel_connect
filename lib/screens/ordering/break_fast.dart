import 'package:flutter/material.dart';
import 'package:hotel_connect/services/database.dart';
import 'package:hotel_connect/shared/constants.dart';
import 'package:hotel_connect/shared/loader_widget.dart';
import 'package:provider/provider.dart';
import 'package:hotel_connect/models/user_model.dart';

class BreakFastOrder extends StatefulWidget {
  @override
  _BreakFastOrderState createState() => _BreakFastOrderState();
}

class _BreakFastOrderState extends State<BreakFastOrder> {
  final _formKey = GlobalKey<FormState>();
  List orders = [];
  bool ordered = false;
  bool loading = false;
  final choices = {
    'coffee': ['1', '2', '3'],
    'tea': ['1', '2', '3'],
    'chocolate': ['1', '2', '3'],
    'porridge': ['1', '2', '3'],
    'milk': ['1', '2', '3'],
    'chappat': ['1', '2', '3'],
    'doughnut': ['1', '2', '3'],
    'pancakes': ['1', '2', '3'],
    'cake': ['1', '2', '3'],
    'bugger': ['1', '2', '3'],
  };
  var coffee = {
    'qty': '1',
    'selected': false,
    'name': 'coffee',
    'price': '1000',
    'paid': 'off',
  };
  var tea = {
    'qty': '1',
    'selected': false,
    'name': 'tea',
    'price': '1000',
    'paid': 'off',
  };
  var chocolate = {
    'qty': '1',
    'selected': false,
    'name': 'chocolate',
    'price': '1500',
    'paid': 'off',
  };
  var porridge = {
    'qty': '1',
    'selected': false,
    'name': 'porridge',
    'price': '1500',
    'paid': 'off',
  };
  var milk = {
    'qty': '1',
    'selected': false,
    'name': 'milk',
    'price': '1500',
    'paid': 'off',
  };
  var chappat = {
    'qty': '1',
    'selected': false,
    'name': 'chappat',
    'price': '1000',
    'paid': 'off',
  };
  var doughnut = {
    'qty': '1',
    'selected': false,
    'name': 'doughnut',
    'price': '500',
    'paid': 'off',
  };
  var pancakes = {
    'qty': '1',
    'selected': false,
    'name': 'pancakes',
    'price': '500',
    'paid': 'off',
  };
  var cake = {
    'qty': '1',
    'selected': false,
    'name': 'cake',
    'price': '2000',
    'paid': 'off',
  };
  var bugger = {
    'qty': '1',
    'selected': false,
    'name': 'bugger',
    'price': '3000',
    'paid': 'off',
  };
  void makeOrder() {
    var items = [
      coffee,
      tea,
      chocolate,
      porridge,
      milk,
      chappat,
      doughnut,
      pancakes,
      cake,
      bugger,
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
                      Center(child: Text('Coffee')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.coffee['qty'],
                          items: this
                              .choices['coffee']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.coffee['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.coffee['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.coffee['selected'],
                            onChanged: (value) => setState(
                                () => this.coffee['selected'] = value)),
                      ),
                      // item two
                      Center(child: Text('Tea')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.tea['qty'],
                          items: this
                              .choices['tea']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.tea['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.tea['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.tea['selected'],
                            onChanged: (value) =>
                                setState(() => this.tea['selected'] = value)),
                      ),
                      // item three
                      Center(child: Text('Chocolate')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.chocolate['qty'],
                          items: this
                              .choices['chocolate']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.chocolate['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.chocolate['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.chocolate['selected'],
                            onChanged: (value) => setState(
                                () => this.chocolate['selected'] = value)),
                      ),
                      // item four
                      Center(child: Text('Porridge')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.porridge['qty'],
                          items: this
                              .choices['porridge']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.porridge['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.porridge['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.porridge['selected'],
                            onChanged: (value) => setState(
                                () => this.porridge['selected'] = value)),
                      ),
                      // item five
                      Center(child: Text('Milk')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.milk['qty'],
                          items: this
                              .choices['milk']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.milk['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.milk['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.milk['selected'],
                            onChanged: (value) =>
                                setState(() => this.milk['selected'] = value)),
                      ),
                      // item six
                      Center(child: Text('chappat')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.chappat['qty'],
                          items: this
                              .choices['chappat']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.chappat['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.chappat['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.chappat['selected'],
                            onChanged: (value) => setState(
                                () => this.chappat['selected'] = value)),
                      ),
                      // item seven
                      Center(child: Text('Doughnut')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.doughnut['qty'],
                          items: this
                              .choices['doughnut']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.doughnut['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.doughnut['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.doughnut['selected'],
                            onChanged: (value) => setState(
                                () => this.doughnut['selected'] = value)),
                      ),
                      // item eight
                      Center(child: Text('Pan cakes')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.pancakes['qty'],
                          items: this
                              .choices['pancakes']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.pancakes['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.pancakes['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.pancakes['selected'],
                            onChanged: (value) => setState(
                                () => this.pancakes['selected'] = value)),
                      ),
                      // item nine
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
                      // item one
                      Center(child: Text('Bugger')),
                      Center(
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration1,
                          value: this.bugger['qty'],
                          items: this
                              .choices['bugger']
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => this.bugger['qty'] = value),
                        ),
                      ),
                      Center(child: Text('${this.bugger['price']}/=')),
                      Center(
                        child: Checkbox(
                            tristate: false,
                            value: this.bugger['selected'],
                            onChanged: (value) => setState(
                                () => this.bugger['selected'] = value)),
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
