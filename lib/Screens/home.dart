import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:floki/Auth/auth.dart';
import 'package:floki/Screens/loading.dart';
import 'package:floki/Screens/sections.dart';
import 'package:floki/Ui/core/app_colors.dart';
import 'package:floki/User/doc.dart';
import 'package:floki/Screens/settings.dart';
import 'package:floki/User/userdata.dart';
import 'package:floki/Screens/usersinfo.dart';
import 'package:floki/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

Auth _sign = Auth();
String txt = '';

// Firestore _fire = Firestore();
bool show = false;

class _ProfileState extends State<Profile> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    check(num radians) {
      // you can adjust this values according to your accuracy requirements
      int r = radians;

      switch (r) {
        case 0:
          setState(() {
            txt = 'Highlights';
          });

          break;
        case 1:
          txt = 'Home';
          break;
        case 2:
          txt = 'Settings';
          break;
      }
    }

    check(_selectedIndex);

    return StreamProvider<List<Doc>>.value(
        catchError: (_, err) => err,
        value: UserData().usersDocs,
        initialData: null,
        child: MaterialApp(
          routes: {
            '/home': (context) => Profile(),
            '/app': (context) => App(),
          },
          home: Scaffold(
              backgroundColor: AppColors.signupBg,
              body: _selectedIndex == 0
                  ? UsersInfo()
                  : _selectedIndex == 1
                      ? Sections()
                      : _selectedIndex == 2
                          ? SettingsForm()
                          : Loading(),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  height: 60,
                  child: FlashyTabBar(
                    animationCurve: Curves.linear,
                    selectedIndex: _selectedIndex,
                    showElevation: true,
                    onItemSelected: (val) => setState(() {
                      _selectedIndex = val;
                    }),
                    items: [
                      FlashyTabBarItem(
                        icon: Icon(Icons.highlight_rounded),
                        title: Text('Job offers'),
                      ),
                      FlashyTabBarItem(
                        icon: Icon(Icons.home_rounded),
                        title: Text('Services'),
                      ),
                      FlashyTabBarItem(
                        icon: Icon(
                          Icons.person_rounded,
                        ),
                        title: Text('Profile'),
                      ),
                    ],
                  ),
                ),
              ),
              floatingActionButton: FabCircularMenu(
                  fabElevation: 2,
                  ringWidth: 100,
                  fabCloseIcon:
                      Icon(Icons.settings_suggest_rounded, color: Colors.white),
                  fabOpenIcon:
                      Icon(Icons.settings_rounded, color: Colors.white),
                  ringColor: AppColors.loginBg,
                  fabColor: AppColors.loginBg,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.help_rounded,
                            color: Colors.white, size: 40),
                        onPressed: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.QUESTION,
                            animType: AnimType.SCALE,
                            title: 'What is floki ?',
                            desc:
                                'Floki is a service that allow users to reach to each other easily through simple and modren ways you can find jobs if are looking for a one or you can offer a service and let other people contact you easily',
                            btnOkOnPress: () {},
                          )..show();
                        }),
                    IconButton(
                        icon: Icon(Icons.question_answer_rounded,
                            color: Colors.white, size: 40),
                        onPressed: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.INFO,
                            animType: AnimType.SCALE,
                            title: 'Contact support',
                            desc:
                                'If are faceing a problem or you want to report a user for an unexceptable behavior or you have a suggestion to improve floki you can contact us via email - albashafarook@gmail.com -',
                            btnOkOnPress: () {},
                          )..show();
                        }),
                    IconButton(
                        icon: Icon(Icons.logout_rounded,
                            color: Colors.white, size: 40),
                        onPressed: () async {
                          await _sign.signOut();
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.SUCCES,
                            animType: AnimType.SCALE,
                            title: 'LogOut',
                            desc:
                                'You have loged out succesfuly please restart the app !',
                            btnOkOnPress: () {},
                          )..show();
                        }),
                  ])),
        ));
  }
}
