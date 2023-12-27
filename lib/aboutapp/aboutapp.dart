import 'package:blogging/auth/authclass.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutApp extends StatefulWidget {
  static const String id = 'aboutapp';
  const AboutApp({Key? key}) : super(key: key);

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/30,),
            Image.asset('images/splashlogo.png',height: MediaQuery.of(context).size.height/2,),
            Text('Hi ${Auth.currentUserEmail()}, welcome to Blogg,',
           style: GoogleFonts.capriola(fontSize: MediaQuery.of(context).size.height/40),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/50,),
            Text('This is a blog app, you can post articles \n and see other\'s articles too,note that,\n you  cannot delete other posts but only \nposts related to you' ,style: GoogleFonts.capriola(fontSize: MediaQuery.of(context).size.height/40),
            )
          ],
        ),
      ),
    );
  }
}
