import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floki/User/user.dart';
import 'package:floki/User/userdata.dart';
import 'package:cloud_functions/cloud_functions.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFunctions functions = FirebaseFunctions.instance;

  User user;
  // Gets the user id
  void getUser() {
    var currentUser = _auth.currentUser;

    if (currentUser != null) {
      print(currentUser.uid);
    }
  }

  TheUser _fromFirebaseUser(User user) {
    return TheUser(uid: user.uid);
  }

  Stream<TheUser> get person {
    return _auth.authStateChanges().map(_fromFirebaseUser);
  }

  bool states;
  // User states
  bool checkStates() {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        states = false;
      } else {
        states = true;
      }
    });
    return states;
  }

  // Sign up with email&password
  Future signUp(String email, String password) async {
    try {
      UserCredential res = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = res.user;
      UserData(uid: user.uid).setUserData(
          pub: false,
          employer: null,
          uid: user.uid,
          name: 'Name',
          job: 'Job',
          age: 00,
          phone: '9640000000000',
          description: 'Description',
          location: 'Location',
          likes: 0);
      return _fromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return null;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Sign in with email&password
  Future signIn(String email, String password) async {
    try {
      UserCredential res = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = res.user;
      return _fromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return null;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
