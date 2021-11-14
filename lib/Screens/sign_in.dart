import 'package:floki/Auth/auth.dart';
import 'package:floki/Ui/constant.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  Auth _sign = Auth();

  String error = '';
  dynamic res;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _size.width * 0.13,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            Padding(
                padding: const EdgeInsets.all(2.5),
                child: Text(error,
                    style: txtGF.copyWith(color: Colors.red, fontSize: 12))),
            Padding(
              padding: const EdgeInsets.all(2.5),
              child: Container(
                width: 400,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 0, 6),
                  child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email!';
                        }
                        return null;
                      },
                      decoration: inputDecoration.copyWith(hintText: 'Email')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.5),
              child: Container(
                width: 400,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 0, 6),
                  child: TextFormField(
                      controller: passController,
                      validator: (value) {
                        if (value.length < 6 || value.isEmpty) {
                          return 'Please enter a 6+ chars password!';
                        }
                        return null;
                      },
                      decoration:
                          inputDecoration.copyWith(hintText: 'Password')),
                ),
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.done_outline_rounded,
                  color: Colors.white,
                ),
                iconSize: 50,
                onPressed: () async {
                  // When sign up button is pressed

                  if (_formKey.currentState.validate()) {
                    setState(() {});
                    res = await _sign.signIn(
                        emailController.text, passController.text);

                    if (res == null) {
                      setState(() {
                        error = 'Could not sign with this credentials!';
                      });
                    }
                  }
                }),
            const Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
