import 'package:floki/Ui/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.signupBg,
      body: Center(
        child: SpinKitFoldingCube(
          color: AppColors.loginBg,
          size: 90,
        ),
      ),
    );
  }
}
