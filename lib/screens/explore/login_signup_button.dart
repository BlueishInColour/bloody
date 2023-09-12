import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
//import '../services/auth_services.dart';
///
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:flutter/foundation.dart';

import 'dart:async';

import '../../constant/configs.dart';
import './profile_screen/init_profile_screen.dart';

class LoginOrSignup extends StatefulWidget {
  final Auth0? auth0;
  const LoginOrSignup({this.auth0, final Key? key}) : super(key: key);

  @override
  State<LoginOrSignup> createState() => LoginOrSignupState();
}

class LoginOrSignupState extends State<LoginOrSignup> {
  //Oauthpart of explore screen

  Credentials? _credentials;
//login service state
  UserProfile? _user;

  late Auth0 auth0;
  late Auth0Web auth0Web;

  @override
  void initState() {
    super.initState();

    //authentication
    auth0 = widget.auth0 ?? Auth0(AUTH0_DOMAIN, AUTH0_CLIENT_ID);
    auth0Web = Auth0Web(AUTH0_DOMAIN, AUTH0_CLIENT_ID);

    if (kIsWeb) {
      auth0Web.onLoad().then((final credentials) => setState(() {
            _user = credentials?.user;
          }));
    }
  }

  Future<void> login() async {
    try {
      if (kIsWeb) {
        return auth0Web.loginWithRedirect(redirectUrl: 'http://localhost:3000');
      }

      var credentials =
          await auth0.webAuthentication(scheme: AUTH0_CUSTOM_SCHEME).login();

      setState(() {
        _user = credentials.user;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() async {
    try {
      if (kIsWeb) {
        await auth0Web.logout(returnToUrl: 'http://localhost:3000');
      } else {
        await auth0.webAuthentication(scheme: AUTH0_CUSTOM_SCHEME).logout();
        setState(() {
          _user = null;
        });
      }
    } catch (e) {
      print(e);
    }
  }

//ending Oauth
  @override
  Widget build(BuildContext context) {
    return (_user == null
        ? ElevatedButton(onPressed: login, child: const Text("login | signup"))
        : GestureDetector(
            onTap: () => Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, _, __) =>
                        ProfileScreen(user: _user, mine: true))),
            child: CircleAvatar(
              backgroundImage:
                  CachedNetworkImageProvider(_user!.pictureUrl.toString()),
            ),
          ));
  }
}
