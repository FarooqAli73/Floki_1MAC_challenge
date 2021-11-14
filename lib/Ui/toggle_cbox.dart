import 'package:firebase_auth/firebase_auth.dart';
import 'package:floki/Ui/core/app_colors.dart';
import 'package:floki/User/userdata.dart';
import 'package:flutter/material.dart';

class TransactionToggle extends StatefulWidget {
  TransactionToggle({this.children}) {
    _isSelected = List.generate(children.length, (index) => false);
  }
  final List<Widget> children;
  List<bool> _isSelected;

  @override
  _TransactionToggleState createState() => _TransactionToggleState();
}

int index;
int butt;
bool button;
final FirebaseAuth _auth = FirebaseAuth.instance;

class _TransactionToggleState extends State<TransactionToggle> {
  @override
  Widget build(BuildContext context) {
    var children = widget.children;
    var _isSelected = widget._isSelected;
    return Column(
      children: [
        Center(
          child: ToggleButtons(
            children: children,
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            onPressed: (index) {
              setState(() {
                for (int buttonIndex = 0;
                    buttonIndex < _isSelected.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    if (!_isSelected[index]) _isSelected[buttonIndex] = true;
                  } else {
                    _isSelected[buttonIndex] = false;
                  }
                }
                setState(() {
                  butt = index;
                });
                print(index);
                button = true;
              });
            },
            isSelected: _isSelected,
            borderRadius: BorderRadius.circular(25),
            selectedColor: Colors.white,
            fillColor: AppColors.loginBg,
            borderColor: AppColors.signupBg,
            selectedBorderColor: AppColors.loginBg,
            borderWidth: 2,
            splashColor: Colors.teal[100],
            constraints: BoxConstraints.expand(
                width: MediaQuery.of(context).size.width /
                    (1.2 * _isSelected.length),
                height: 60),
          ),
        ),
        SizedBox(height: 35),
        button == true
            ? Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: AppColors.loginBg,
                  borderRadius: BorderRadius.circular(180),
                ),
                child: IconButton(
                    onPressed: () async {
                      print('butt : $butt');
                      if (butt == 1) {
                        await UserData(uid: _auth.currentUser.uid).setType(
                            employer: false, uid: _auth.currentUser.uid);
                      }
                      if (butt == 0) {
                        await UserData(uid: _auth.currentUser.uid).setType(
                            employer: true, uid: _auth.currentUser.uid);
                      }
                    },
                    color: AppColors.loginBg,
                    icon: Icon(
                      Icons.done_rounded,
                      color: Colors.white,
                      size: 60,
                    )),
              )
            : Text('')
      ],
    );
  }
}
