import 'dart:async';

import 'package:blogging/auth/auth_pag.dart';
import 'package:blogging/auth/authclass.dart';
import 'package:blogging/pages/pages.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static const String id = 'splashpage';
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  splash(){
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, Auth.isLoggedin() ? allPages.id : AuthPage.id);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splash();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/splashlogo.png',height: MediaQuery.of(context).size.height/2,)
          ],
        ),
      ),
    );
  }
}
