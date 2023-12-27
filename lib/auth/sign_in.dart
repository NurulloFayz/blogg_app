import 'package:blogging/auth/auth_pag.dart';
import 'package:blogging/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'authclass.dart';

class SignIn extends StatefulWidget {
  static const String id = 'signin';
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var email = TextEditingController();
  var password = TextEditingController();
  signIn(){
    String email_controller = email.text.toString().trim();
    String password_controller = password.text.toString().trim();
    if(email_controller.isEmpty || password_controller.isEmpty){
      return;
    }else{
      Auth.SignInUser(email_controller, password_controller).then((value) => {
        Navigator.pushReplacementNamed(context,allPages.id)
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/refer.png',height: MediaQuery.of(context).size.height/4,),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              Container(
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/25,
                  left: MediaQuery.of(context).size.width/25,
                ),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.capriola(
                        fontSize: MediaQuery.of(context).size.height/40,
                      ),
                      hintText: 'email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              Container(
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/25,
                  left: MediaQuery.of(context).size.width/25,
                ),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.capriola(
                        fontSize: MediaQuery.of(context).size.height/40,
                      ),
                      hintText: 'password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",style:  GoogleFonts.capriola(
                      fontSize: MediaQuery.of(context).size.height/40,color: Colors.grey
                  ),),
                  SizedBox(width: MediaQuery.of(context).size.width/30,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, AuthPage.id);
                    },
                    child: Text('Sign up',style:  GoogleFonts.capriola(
                        fontSize: MediaQuery.of(context).size.height/35,color: Colors.black
                    ),),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              Container(
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/25,
                    left: MediaQuery.of(context).size.width/25,
                  ),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: Colors.black,
                    onPressed: (){
                      signIn();
                    },
                    minWidth: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/12,
                    child: Text('Sign in',style:  GoogleFonts.capriola(
                        fontSize: MediaQuery.of(context).size.height/40,color: Colors.white
                    ),),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
