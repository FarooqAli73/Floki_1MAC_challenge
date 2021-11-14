import 'dart:io';
import 'package:floki/Auth/auth.dart';
import 'package:floki/Ui/constant.dart';
import 'package:floki/Ui/core/app_colors.dart';
import 'package:floki/Ui/pushable_button.dart';
import 'package:floki/User/userdata.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatelessWidget {
  final String name;
  final String uid;
  final int age;
  final int likes;
  final String location;
  final String phone;
  final String description;
  final String job;

  Info(
      {this.name,
      this.job,
      this.likes,
      this.age,
      this.description,
      this.location,
      this.phone,
      this.uid});

  @override
  Widget build(BuildContext context) {
    openwhatsapp() async {
      var whatsapp = phone;
      // ignore: non_constant_identifier_names
      var WhatsAppURlAndroid =
          "whatsapp://send?phone=" + whatsapp + "&text=hello";
      var whatappURLIos = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
      if (Platform.isIOS) {
        // for iOS phone only
        if (await canLaunch(whatappURLIos)) {
          await launch(whatappURLIos, forceSafariVC: false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: new Text("whatsapp no installed")));
        }
      } else {
        // android , web
        if (await canLaunch(WhatsAppURlAndroid)) {
          await launch(WhatsAppURlAndroid);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: new Text("whatsapp is not installed")));
        }
      }
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.signupBg,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 11),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:
                        Text(name ?? '', style: txtGF.copyWith(fontSize: 36)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.loginBg,
                        ),
                        child: TextButton.icon(
                          icon: Icon(Icons.call, size: 30),
                          label: Text(
                            'WhatsApp',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async =>
                              await openwhatsapp() ?? print('error '),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.redAccent,
                        ),
                        child: TextButton.icon(
                            icon: Icon(
                              Icons.favorite_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            label: Text(
                              'Favorite',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () async {
                              await UserData(uid: uid)
                                  .updateLikes(likes: likes + 1, uid: uid);
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.handyman_rounded,
                                  color: Colors.grey[400],
                                  size: 25,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  job,
                                  style: txtGF.copyWith(fontSize: 25),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.place_rounded,
                                  color: Colors.yellow,
                                  size: 25,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  location,
                                  style: txtGF.copyWith(fontSize: 25),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  likes.toString(),
                                  style: txtGF.copyWith(fontSize: 25),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'About me',
                              style: txtGF.copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                        Divider(
                          indent: 10,
                          endIndent: 240,
                          height: 1,
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(description ?? '',
                                style: txtStyle2.copyWith(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.loginBg,
            elevation: 5,
            onPressed: () {
              print('us');
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_rounded, color: Colors.white)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
