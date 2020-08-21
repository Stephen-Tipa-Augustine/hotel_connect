import 'package:flutter/material.dart';

var textInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(32.0),
    borderSide: BorderSide(
      color: Colors.white,
      width: 3.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(32.0),
    borderSide: BorderSide(
      color: Colors.pink,
      width: 3.0,
    ),
  ),
);

var textInputDecoration1 = InputDecoration(
  filled: true,
  fillColor: Colors.blueGrey,
  contentPadding: EdgeInsets.zero,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.redAccent,
      width: 1.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.pink,
      width: 1.0,
    ),
  ),
);

const headingTextStyle = TextStyle(
  color: Colors.redAccent,
  fontWeight: FontWeight.bold,
  fontSize: 32,
  fontStyle: FontStyle.italic,
  decoration: TextDecoration.none,
);
const heading1TextStyle = TextStyle(
  color: Colors.redAccent,
  fontWeight: FontWeight.bold,
  fontSize: 30,
  fontStyle: FontStyle.italic,
  decoration: TextDecoration.none,
);
const heading2TextStyle = TextStyle(
  color: Colors.blueAccent,
  fontWeight: FontWeight.w600,
  fontSize: 28,
  fontStyle: FontStyle.italic,
  decoration: TextDecoration.none,
);
const heading3TextStyle = TextStyle(
  color: Colors.redAccent,
  fontWeight: FontWeight.w500,
  fontSize: 26,
  fontStyle: FontStyle.italic,
  decoration: TextDecoration.none,
);
const heading4TextStyle = TextStyle(
  color: Colors.redAccent,
  fontWeight: FontWeight.w400,
  fontSize: 24,
  fontStyle: FontStyle.italic,
  decoration: TextDecoration.none,
);
const heading5TextStyle = TextStyle(
  color: Colors.brown,
  fontWeight: FontWeight.w300,
  fontSize: 22,
  fontStyle: FontStyle.italic,
  decoration: TextDecoration.none,
);
const bodyTextStyle = TextStyle(
  color: Colors.blueGrey,
  fontWeight: FontWeight.w300,
  fontSize: 20,
  fontStyle: FontStyle.normal,
  decoration: TextDecoration.none,
);
