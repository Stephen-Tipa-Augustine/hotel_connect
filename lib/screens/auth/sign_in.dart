import 'package:hotel_connect/services/auth_services.dart';
import 'package:hotel_connect/shared/constants.dart';
import 'package:hotel_connect/shared/loader_widget.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  final Function toggleView;
  SignInPage({this.toggleView});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthServices _authServices = AuthServices();
  final _formKey = GlobalKey<FormState>();
  // state variables for the form fields
  String email = '';
  String pwd = '';
  String error = '';
  bool loading = false;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            setState(() {
              loading = true;
            });
            dynamic result =
                _authServices.logInWithEmailAndPassword(this.email, this.pwd);
            if (result == null) {
              setState(() {
                loading = false;
                this.error = "Please provide valid credentials";
              });
            }
          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final registerButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => widget.toggleView(),
        child: Text("Register",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final emailField = TextFormField(
      validator: (value) => value.isEmpty ? "Enter an email" : null,
      onChanged: (value) => setState(() => this.email = value),
      obscureText: false,
      style: style,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextFormField(
      validator: (value) => (value.isEmpty || value.length < 6)
          ? "Enter a password 6+ characters long"
          : null,
      onChanged: (value) => setState(() => this.pwd = value),
      obscureText: true,
      style: style,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    return loading
        ? LoaderWidget()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Log In'),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 80.0,
                            child: Image.asset(
                              "assets/images/level3.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 15.0),
                          emailField,
                          SizedBox(height: 15.0),
                          passwordField,
                          SizedBox(
                            height: 25.0,
                          ),
                          loginButon,
                          SizedBox(
                            height: 15.0,
                          ),
                          Text("Don't have an account?"),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          ),
                          registerButon,
                        ],
                      )),
                ),
              ),
            ),
          );
  }
}
