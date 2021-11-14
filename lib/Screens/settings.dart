import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:floki/Screens/loading.dart';
import 'package:floki/Ui/constant.dart';
import 'package:floki/Ui/core/app_colors.dart';
import 'package:floki/Ui/toggle_cbox.dart';
import 'package:floki/User/user.dart';
import 'package:floki/User/userdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  int _age = 17;
  String _name;
  String _description;
  String _phone;

  final List<String> _jobs = [
    'Job',
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
  final List<String> _locations = [
    'Location',
    'Al Anbar',
    'Babylon',
    'Baghdad',
    'Basra',
    'Dhi Qar',
    'Al-Qadisiyyah',
    'Diyala',
    'Duhok',
    'Erbil',
    'Karbala',
    'Kirkuk',
    'Muthanna',
    'Najaf',
    'Nineveh',
    'Saladin',
    'Sulaymaniyah',
    'Wasit',
  ];
  String _job;
  String _location;
  List<Widget> toggels = [
    Icon(Icons.work_rounded, color: Colors.white, size: 60),
    Icon(
      Icons.engineering,
      color: Colors.white,
      size: 60,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<TheUser>(context);

    return StreamBuilder(
        stream: UserData(uid: _user.uid).userDataSnap,
        builder: (context, snapshot) {
          UserDataSnap userData = snapshot.data as UserDataSnap;

          return userData == null
              ? Loading()
              : userData.employer == null
                  ? MaterialApp(
                      home: Scaffold(
                        backgroundColor: AppColors.signupBg,
                        body: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Arrow(
                                      edge: Edge.BOTTOM,
                                      clipShadows: [
                                        ClipShadow(color: Colors.black)
                                      ],
                                      triangleHeight: 40.0,
                                      rectangleClipHeight: 0.0,
                                      child: Container(
                                        width: 150.0,
                                        color: AppColors.loginBg,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 10, 10, 40),
                                          child: Text(
                                            '''If you are offering a job or you are company that want employes you should choose this option''',
                                            style: txtGF.copyWith(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Arrow(
                                      edge: Edge.BOTTOM,
                                      clipShadows: [
                                        ClipShadow(color: Colors.black)
                                      ],
                                      triangleHeight: 40.0,
                                      rectangleClipHeight: 0.0,
                                      child: Container(
                                        width: 150.0,
                                        color: AppColors.loginBg,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 10, 10, 40),
                                          child: Text(
                                            '''If you are an indviual or company offering a service choose this option''',
                                            style: txtGF.copyWith(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TransactionToggle(
                              children: toggels,
                            ),
                          ],
                        ),
                      ),
                    )
                  : userData.employer != null
                      ? MaterialApp(
                          home: Scaffold(
                              resizeToAvoidBottomInset: false,
                              backgroundColor: AppColors.signupBg,
                              body: Form(
                                key: _formKey,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 22.0, horizontal: 11),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  color: Colors.white),
                                              child: TextFormField(
                                                decoration:
                                                    txtFormField.copyWith(
                                                        labelText: 'Enter name',
                                                        labelStyle: TextStyle(
                                                            color: Colors
                                                                .grey[500],
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                onChanged: (val) {
                                                  _name = val;
                                                },
                                                initialValue:
                                                    _name ?? userData.name,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please enter a name!';
                                                  }
                                                  return null;
                                                },
                                                keyboardType:
                                                    TextInputType.name,
                                                style: new TextStyle(
                                                  fontFamily: "Poppins",
                                                ),
                                              ),
                                            )),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  color: Colors.white),
                                              child: TextFormField(
                                                decoration:
                                                    txtFormField.copyWith(
                                                        labelText:
                                                            'Enter Description',
                                                        labelStyle: TextStyle(
                                                            color: Colors
                                                                .grey[500],
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                onChanged: (val) {
                                                  _description = val;
                                                },
                                                initialValue:
                                                    _name ?? userData.des,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please enter a Description!';
                                                  }
                                                  return null;
                                                },
                                                keyboardType:
                                                    TextInputType.text,
                                                style: new TextStyle(
                                                  fontFamily: "Poppins",
                                                ),
                                              ),
                                            )),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  color: Colors.white),
                                              child: TextFormField(
                                                decoration:
                                                    txtFormField.copyWith(
                                                        labelText:
                                                            'Enter phone',
                                                        labelStyle: TextStyle(
                                                            color: Colors
                                                                .grey[500],
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                onChanged: (val) {
                                                  _phone = val;
                                                },
                                                initialValue:
                                                    _name ?? userData.phone,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please enter phone number!';
                                                  }
                                                  return null;
                                                },
                                                keyboardType:
                                                    TextInputType.phone,
                                                style: new TextStyle(
                                                  fontFamily: "Poppins",
                                                ),
                                              ),
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(width: 15),
                                              Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      if (_age < 100) {
                                                        _age += 1;
                                                      }
                                                    });
                                                  },
                                                  child: Text('+',
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .signupBg,
                                                          fontSize: 20)),
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                child: Center(
                                                  child: Text(
                                                    _age == 17
                                                        ? userData.age
                                                            .toString()
                                                        : _age.toString(),
                                                    style: txtGF.copyWith(
                                                        color:
                                                            AppColors.signupBg),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white),
                                                child: TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      if (_age > 18) {
                                                        _age = _age - 1;
                                                      }
                                                    });
                                                  },
                                                  child: Text('-',
                                                      style: TextStyle(
                                                        color:
                                                            AppColors.signupBg,
                                                        fontSize: 20,
                                                      )),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 1),
                                              child: DropdownButton<String>(
                                                icon: Icon(
                                                    Icons.handyman_rounded),
                                                iconDisabledColor: Colors.grey,
                                                iconEnabledColor: Colors.black,
                                                dropdownColor: Colors.white,
                                                value: _job ?? userData.job,
                                                items:
                                                    _jobs.map((String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(
                                                      value,
                                                      style: txtGF.copyWith(
                                                          color: Colors.black),
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (value) {
                                                  setState(() {
                                                    _job = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 1),
                                              child: DropdownButton<String>(
                                                icon: Icon(
                                                    Icons.my_location_rounded),
                                                iconDisabledColor: Colors.grey,
                                                iconEnabledColor: Colors.black,
                                                dropdownColor: Colors.white,
                                                value: _location ??
                                                    userData.location,
                                                items: _locations
                                                    .map((String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value,
                                                        style: txtGF.copyWith(
                                                            color:
                                                                Colors.black)),
                                                  );
                                                }).toList(),
                                                onChanged: (value) {
                                                  setState(() {
                                                    _location = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: TextButton(
                                              onPressed: () async {
                                                if (_formKey.currentState
                                                    .validate()) {
                                                  _location == null
                                                      ? _location =
                                                          userData.location
                                                      : print(_location);
                                                  _age == 17
                                                      ? _age = userData.age
                                                      : print(_age);
                                                  _name == null
                                                      ? _name = userData.name
                                                      : print(_name);
                                                  _description == null
                                                      ? _description =
                                                          userData.des
                                                      : print(_description);
                                                  _phone == null
                                                      ? _phone = userData.phone
                                                      : print(_phone);

                                                  _job == null
                                                      ? _job = userData.job
                                                      : print(_job);
                                                  await UserData(uid: _user.uid)
                                                      .updateUser(
                                                          pub: true,
                                                          uid: _user.uid,
                                                          name: _name,
                                                          job: _job,
                                                          phone: _phone,
                                                          des: _description,
                                                          location: _location);
                                                  AwesomeDialog(
                                                    context: context,
                                                    dialogType:
                                                        DialogType.SUCCES,
                                                    animType: AnimType.SCALE,
                                                    title: 'User Data',
                                                    desc:
                                                        'User data has updated succesfully !',
                                                    btnOkOnPress: () {},
                                                  )..show();
                                                }
                                              },
                                              child: Icon(Icons.done_rounded,
                                                  size: 40,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )))
                      : Text('');
        });
  }
}
