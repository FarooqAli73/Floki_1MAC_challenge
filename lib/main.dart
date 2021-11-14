import 'package:firebase_core/firebase_core.dart';
import 'package:floki/User/user.dart';
import 'package:floki/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Auth/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false

  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return Text(
        'Error!',
        style: TextStyle(fontSize: 15),
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return CircularProgressIndicator();
    }
    // ignore: avoid_init_to_null
    var jack = null;
    return StreamProvider<TheUser>.value(
      value: Auth().person,
      initialData: jack,
      child: MaterialApp(home: Wrapper()),
    );
  }
}
