import 'package:blogging/auth/auth_pag.dart';
import 'package:blogging/auth/authclass.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../aboutapp/aboutapp.dart';

class ProfilePage extends StatefulWidget {
  static const String id = 'profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Profile',
            style: GoogleFonts.capriola(
              fontSize: MediaQuery.of(context).size.height / 25,
              color: Colors.black,
            ),
          ),
        ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.2,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
                topRight:  Radius.circular(40),
                )
              ),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height/20,),
                  ListTile(
                    subtitle: Text('your email',style: GoogleFonts.capriola(
                        fontSize: MediaQuery.of(context).size.height/55
                    )),
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(Icons.person,color: Colors.white,),
                    ),
                    title: Text('${Auth.currentUserEmail()}',style: GoogleFonts.capriola(
                        fontSize: MediaQuery.of(context).size.height/35
                    ),),
                  ),
                  ListTile(
                    onTap: (){
                      Navigator.pushNamed(context,AboutApp.id);
                    },
                    subtitle: Text('get to know about us',style: GoogleFonts.capriola(
                        fontSize: MediaQuery.of(context).size.height/55
                    )),
                    trailing: Icon(Icons.navigate_next_sharp),
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(Icons.app_registration_rounded,color: Colors.white,),
                    ),
                    title: Text('About app',style: GoogleFonts.capriola(
                        fontSize: MediaQuery.of(context).size.height/35
                    ),),
                  ),
                  ListTile(
                    onTap: (){
                      setState(() {
                        Auth.SignOutUser(context);
                        Navigator.pushReplacementNamed(context, AuthPage.id);
                      });
                    },
                    subtitle: Text('tap to log out',style: GoogleFonts.capriola(
                        fontSize: MediaQuery.of(context).size.height/55
                    )),
                    trailing: Icon(Icons.navigate_next_sharp),
                    leading:CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(Icons.logout,color: Colors.white,),
                    ),
                    title: Text('Logout',style: GoogleFonts.capriola(
                        fontSize: MediaQuery.of(context).size.height/35
                    ),),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
