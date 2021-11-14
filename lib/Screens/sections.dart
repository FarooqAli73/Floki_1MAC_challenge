import 'package:clippy_flutter/paralellogram.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floki/Screens/home.dart';
import 'package:floki/Screens/usersinfo.dart';
import 'package:floki/Ui/constant.dart';
import 'package:floki/Ui/core/app_colors.dart';
import 'package:flutter/material.dart';

class Sections extends StatefulWidget {
  @override
  _SectionsState createState() => _SectionsState();
}

String job;
List jobs = [
  'Welder',
  'Plumber',
  'Carpenter',
  'Painter',
  'Electrician',
  'Mechanical',
  'AC',
  'Builder',
  'Delivery',
  'Shop/Store',
  'Barber',
  'Tutor',
  'Else'
];
bool users;

class _SectionsState extends State<Sections> {
  @override
  Widget build(BuildContext context) {
    return users == true
        ? UsersInfo(job)
        : Scaffold(
            backgroundColor: AppColors.signupBg,
            body: ListView.builder(
                itemCount: jobs.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://static.vecteezy.com/system/resources/previews/003/096/710/original/set-tools-doodle-illustration-vector.jpg'),
                                fit: BoxFit.cover),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                users = true;
                                job = jobs[index];
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Parallelogram(
                                  cutLength: 30.0,
                                  edge: Edge.LEFT,
                                  child: Container(
                                    color: AppColors.loginBg,
                                    width: 150.0,
                                    height: 200.0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: 110,
                                            child: Center(
                                                child: Text(
                                              jobs[index].toString(),
                                              style: txtGF,
                                            )))
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Icon(
                                  Icons.sort_rounded,
                                  color: Colors.blue,
                                  size: 40,
                                )
                              ],
                            ),
                          )));
                }),
          );
  }
}
