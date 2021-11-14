import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:floki/Screens/loading.dart';
import 'package:floki/Ui/constant.dart';
import 'package:floki/Ui/core/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../User/doc.dart';
import 'info.dart';

// ignore: must_be_immutable
class UsersInfo extends StatefulWidget {
  final String jbo;
  UsersInfo([this.jbo]);
  @override
  _UsersInfoState createState() => _UsersInfoState(this.jbo);
}

class _UsersInfoState extends State<UsersInfo> {
  bool show = false;
  final String jbo;
  _UsersInfoState([this.jbo]);

  dynamic usersDocsFromFS;
  Null nullVal;

  @override
  Widget build(BuildContext context) {
    try {
      usersDocsFromFS = Provider.of<List<Doc>>(context);
    } catch (e) {
      print(e);
      usersDocsFromFS = null;
    }

    return Scaffold(
      backgroundColor: AppColors.signupBg,
      body: usersDocsFromFS == null
          ? Loading()
          : ListView.builder(
              itemBuilder: (context, index) {
                String uid;
                int age;
                String location;
                String name;
                String des;
                String phone;
                String job;
                int likes;
                if (jbo != null) {
                  if (usersDocsFromFS[index].pub == true) {
                    if (usersDocsFromFS[index].employer == false) {
                      if (jbo == usersDocsFromFS[index].job) {
                        uid = usersDocsFromFS[index].uid;
                        location = usersDocsFromFS[index].location;
                        age = usersDocsFromFS[index].age;
                        name = usersDocsFromFS[index].title;
                        des = usersDocsFromFS[index].description;
                        phone = usersDocsFromFS[index].phone;
                        job = usersDocsFromFS[index].job;
                        likes = usersDocsFromFS[index].likes;
                      }
                    }
                  }
                }

                if (jbo == null) {
                  if (usersDocsFromFS[index].pub == true) {
                    if (usersDocsFromFS[index].employer == true) {
                      uid = usersDocsFromFS[index].uid;
                      location = usersDocsFromFS[index].location;
                      age = usersDocsFromFS[index].age;
                      name = usersDocsFromFS[index].title;
                      des = usersDocsFromFS[index].description;
                      phone = usersDocsFromFS[index].phone;
                      job = usersDocsFromFS[index].job;
                      likes = usersDocsFromFS[index].likes;
                    }
                  }
                }

                if (job == null) {
                  show = true;
                }

                return job == null
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://static.vecteezy.com/system/resources/previews/003/096/710/original/set-tools-doodle-illustration-vector.jpg'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  job = job;
                                  likes = likes;
                                  name = name;
                                  location = location;
                                  phone = phone;
                                  age = age;
                                  des = des;
                                  uid = uid;
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Info(
                                              likes: likes ?? 00,
                                              uid: uid ?? '8899',
                                              name: name ?? 'Name',
                                              location: location ?? 'Location',
                                              phone: phone ?? '123456789',
                                              age: age ?? 99,
                                              description: des ?? 'qwerty',
                                              job: job,
                                            )));
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
                                      child: Container(
                                        color: AppColors.loginBg,
                                        width: 150.0,
                                        height: 200.0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                width: 120,
                                                child: Text('      $name',
                                                    style: txtGF.copyWith(
                                                        fontSize: 14))),
                                            SizedBox(
                                              height: 2.5,
                                            ),
                                            Container(
                                                width: 125,
                                                child: Text('          $job',
                                                    style: txtGF.copyWith(
                                                        fontSize: 14))),
                                            SizedBox(
                                              height: 2.5,
                                            ),
                                            Container(
                                                width: 125,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                        '            $location',
                                                        style: txtGF.copyWith(
                                                            fontSize: 14)),
                                                    Icon(Icons.place_rounded,
                                                        size: 15,
                                                        color: Colors.black),
                                                  ],
                                                )),
                                            SizedBox(
                                              height: 2.5,
                                            ),
                                            Container(
                                                width: 125,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      '              $likes',
                                                      style: txtGF.copyWith(
                                                          fontSize: 14),
                                                    ),
                                                    Icon(
                                                      Icons.favorite_rounded,
                                                      size: 15,
                                                      color: Colors.red,
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Icon(
                                    Icons.verified_rounded,
                                    size: 40,
                                    color: Colors.blue,
                                  )
                                ],
                              ),
                            )));
              },
              itemCount: usersDocsFromFS.length,
            ),
    );
  }
}
