import 'package:hotel_connect/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel _createUserFromFirebaseUser(FirebaseUser user) =>
      user != null ? UserModel(uid: user.uid) : null;

  // On auth change
  Stream<UserModel> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _createUserFromFirebaseUser(user))
        .map(_createUserFromFirebaseUser);
  }

  // Signin anonymously
  Future signInAnonym() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _createUserFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  //Sign in with email
  Future logInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _createUserFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  //Sign up with email and password
  Future registerWithEmailAndPassword(
      {String email,
      String password,
      String userName,
      String firstName,
      String lastName,
      String contact}) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _createUserFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  //Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
