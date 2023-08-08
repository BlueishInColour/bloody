import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import '../main.dart';

class SignUpInOutScreeen extends StatefulWidget {
  const SignUpInOutScreeen({super.key});

  @override
  State<SignUpInOutScreeen> createState() => SignUpInOutScreeenState();
}

class SignUpInOutScreeenState extends State<SignUpInOutScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FlutterLogin(
        // logo: 'freakin',
        logoTag: 'freakin',
        // title: 'freakin',
        theme: LoginTheme(
            pageColorDark: palette.black,
            pageColorLight: palette.white,
            buttonTheme: LoginButtonTheme(backgroundColor: palette.red)),
        loginAfterSignUp: true,
        additionalSignupFields: [
          UserFormField(
              keyName: 'username', icon: Icon(Icons.alternate_email_outlined)),
          UserFormField(
              keyName: 'date of birth',
              icon: Icon(Icons.calendar_view_month_rounded)),
          UserFormField(keyName: 'freak')
        ],
        userType: LoginUserType.name,
        headerWidget: headerWidget(),
        onLogin: (text) async => 'login',
        onRecoverPassword: (text) async => 'forgottten password?',
        onSignup: (_) async => 'signup',
      ),
    );
  }

  headerWidget() {
    return CircleAvatar(
        backgroundColor: Colors.white,
        radius: 20,
        child: Icon(
            size: 30,
            Icons.local_fire_department_outlined,
            color: palette.red));
  }
}
