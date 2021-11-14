import 'package:floki/Screens/auth_page.dart';
import 'package:floki/Screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'User/user.dart';

class Wrapper extends StatefulWidget {
  Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);

    return user == null
        ? MaterialApp(
            home: AuthPage(), title: 'Named Routes Demo',
            // Start the app with the "/" named route. In this case, the app starts
            // on the FirstScreen widget.
          )
        : MaterialApp(
            home: Profile(),
          );
  }
}
