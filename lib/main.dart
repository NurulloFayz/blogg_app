import 'package:blogging/auth/auth_pag.dart';
import 'package:blogging/auth/authclass.dart';
import 'package:blogging/auth/sign_in.dart';
import 'package:blogging/pages/homepage.dart';
import 'package:blogging/pages/pages.dart';
import 'package:blogging/pages/profile_page.dart';
import 'package:blogging/splash/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'aboutapp/aboutapp.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'bloggapps',
      options: FirebaseOptions(
          apiKey: 'apiKey',
          appId: 'appId',
          messagingSenderId: 'messagingSenderId',
          projectId: 'projectId')
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
      routes: {
        HomePage.id:(context) => const HomePage(),
        allPages.id:(context) => const allPages(),
        ProfilePage.id:(context) => const ProfilePage(),
        AuthPage.id:(context) => const AuthPage(),
        SignIn.id:(context) => const SignIn(),
        AboutApp.id:(context) => const AboutApp(),
      },
    );
  }
}


