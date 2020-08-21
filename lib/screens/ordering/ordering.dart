import 'package:flutter/material.dart';
import 'package:hotel_connect/screens/ordering/break_fast.dart';
import 'package:hotel_connect/screens/ordering/desserts.dart';
import 'package:hotel_connect/screens/ordering/drinks.dart';
import 'package:hotel_connect/screens/ordering/meals.dart';
import 'package:hotel_connect/services/load_image_storage.dart';
import 'package:hotel_connect/shared/constants.dart';

class OrderingPage extends StatelessWidget {
  void displayOrderingForm(BuildContext context, String item) {
    dynamic view = Container();
    switch (item) {
      case 'breakFast':
        view = BreakFastOrder();
        break;
      case 'desserts':
        view = DessertOrder();
        break;
      case 'drinks':
        view = DrinksOrder();
        break;
      case 'meals':
        view = MealOrder();
        break;
      default:
        view = Container();
    }
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: view,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(1, 89, 99, 1.0), Colors.redAccent[100]],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 100,
              child: Card(
                elevation: 0.0,
                color: Colors.redAccent[100],
                child: Center(
                  child: Text(
                    'Start Making Orders tapping on the grid list below',
                    style: bodyTextStyle.copyWith(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            GridView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0),
              children: <Widget>[
                GestureDetector(
                  onTap: () => displayOrderingForm(context, 'breakFast'),
                  child: Card(
                    color: Colors.pinkAccent[100],
                    child: Column(
                      children: [
                        Center(
                          child: SizedBox(
                            height: 120,
                            width: 120,
                            child: GetImageFromFirebase(
                              filePath: 'order_items/breakfast.jpg',
                            ),
                          ),
                        ),
                        Text(
                          'BreakFast',
                          style: heading3TextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => displayOrderingForm(context, 'drinks'),
                  child: Card(
                    color: Colors.pinkAccent[100],
                    child: Column(
                      children: [
                        Center(
                          child: SizedBox(
                            height: 120,
                            width: 120,
                            child: GetImageFromFirebase(
                              filePath: 'order_items/drinks.jpg',
                            ),
                          ),
                        ),
                        Text(
                          'Drinks',
                          style: heading3TextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => displayOrderingForm(context, 'meals'),
                  child: Card(
                    color: Colors.pinkAccent[100],
                    child: Column(
                      children: [
                        Center(
                          child: SizedBox(
                            height: 120,
                            width: 120,
                            child: GetImageFromFirebase(
                              filePath: 'order_items/meal.jpg',
                            ),
                          ),
                        ),
                        Text(
                          'Meals',
                          style: heading3TextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => displayOrderingForm(context, 'desserts'),
                  child: Card(
                    color: Colors.pinkAccent[100],
                    child: Column(
                      children: [
                        Center(
                          child: SizedBox(
                            height: 120,
                            width: 120,
                            child: GetImageFromFirebase(
                              filePath: 'order_items/dessert.jpg',
                            ),
                          ),
                        ),
                        Text(
                          'Desserts',
                          style: heading3TextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
