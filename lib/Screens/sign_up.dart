import 'package:floki/Auth/auth.dart';
import 'package:floki/Ui/constant.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  Auth _sign = Auth();

  dynamic res;
  String error = '';
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
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
          children: [
            const Spacer(flex: 3),
            Padding(
              padding: EdgeInsets.all(2.5),
              child: Text(error,
                  style: txtGF.copyWith(color: Colors.red, fontSize: 12)),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: 400,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 8, 0, 6),
                  child: TextFormField(
                      autocorrect: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email!';
                        }
                        return null;
                      },
                      controller: emailController,
                      decoration: inputDecoration.copyWith(hintText: 'Email')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: 400,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 8, 0, 6),
                  child: TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'Please enter 6+ chars long password';
                        }
                        return null;
                      },
                      controller: passController,
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
                    res = await _sign.signUp(
                        emailController.text, passController.text);

                    if (res == null) {
                      setState(() {
                        error = 'Could not sign with this credentials!';
                      });
                    } else {
                      error = '';
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
