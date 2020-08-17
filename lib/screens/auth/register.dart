import 'package:hotel_connect/services/auth_services.dart';
import 'package:hotel_connect/shared/constants.dart';
import 'package:hotel_connect/shared/loader_widget.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _authServices = AuthServices();
  String error = '';
  // state variables for form fields
  String email = '';
  String pwd = '';
  String pwdConfirm = '';
  String usrName = '';
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  bool privacyAccepted = false;

  void privacyAndTerms(bool newValue) {
    setState(() {
      privacyAccepted = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        onPressed: () => Navigator.pop(context),
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final registerButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: privacyAccepted ? Color(0xff01A0C7) : Colors.grey,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: privacyAccepted
            ? () async {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    loading = true;
                  });
                  dynamic result = _authServices.registerWithEmailAndPassword(
                      this.email, this.pwd);
                  if (result == null) {
                    setState(() {
                      loading = false;
                      this.error = "Please provide valid data for registration";
                    });
                  }
                }
              }
            : null,
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
    final userNameField = TextFormField(
      validator: (value) =>
          (value.isEmpty || value.contains(new RegExp(r'\\s+')))
              ? "Enter a unique username"
              : null,
      onChanged: (value) => setState(() => this.usrName = value),
      obscureText: false,
      style: style,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter Username",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField1 = TextFormField(
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
    final passwordField2 = TextFormField(
      validator: (value) =>
          (this.pwd != value) ? "The two passwords do not match please" : null,
      onChanged: (value) => setState(() => this.pwdConfirm = value),
      obscureText: true,
      style: style,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Confirm Password",
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
              title: Text('Register'),
              actions: <Widget>[
                FlatButton.icon(
                  onPressed: () => widget.toggleView(),
                  icon: Icon(Icons.person_pin),
                  label: Text('Sign In'),
                ),
              ],
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
                          SizedBox(height: 10.0),
                          userNameField,
                          SizedBox(height: 10.0),
                          emailField,
                          SizedBox(height: 10.0),
                          passwordField1,
                          SizedBox(height: 10.0),
                          passwordField2,
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "I Accept the Terms",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    decoration: TextDecoration.underline),
                              ),
                              Checkbox(
                                  tristate: false,
                                  value: privacyAccepted,
                                  onChanged: privacyAndTerms)
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          registerButon,
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          );
  }
}
