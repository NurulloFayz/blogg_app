import 'package:blogging/auth/authclass.dart';
import 'package:blogging/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var content = TextEditingController();
  static DateTime time = DateTime.now();
  static var year = '${time.year}';
  static var month = '${time.month}';
  static var day = '${time.day}';
  static var hour = '${time.hour}';
  static var minute = '${time.minute}';
  String times = '${day}.${month}.${year},${hour}:${minute}';
  void submitPost() {
    if ( content.text.isNotEmpty) {
      // Save the blog post to Firestore
      FirebaseFirestore.instance.collection('posts').add({
        'content': content.text,
        'author': Auth.currentUserEmail(), // Replace with actual user authentication
        'timestamp': times,
      });

      content.clear();
      Navigator.pushReplacementNamed(context,  allPages.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Create post',style: GoogleFonts.capriola(
            fontSize: MediaQuery.of(context).size.height/25,
            color: Colors.black
        ),),
      ),
      body:Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height/30,),
          Container(
            margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/30,
            left: MediaQuery.of(context).size.width/30,
            ),
            child: TextField(
              controller: content,
              maxLines: null,
              style: GoogleFonts.capriola(
                  fontSize: MediaQuery.of(context).size.height/35,
                  color: Colors.black
              ),
              decoration: InputDecoration(
                hintText: 'Write here',
                hintStyle: GoogleFonts.capriola(
                  fontSize: MediaQuery.of(context).size.height/40,
                  color: Colors.grey
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none
                )
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: (){
        submitPost();
        },
        label: Text('add post',style:GoogleFonts.capriola(
            fontSize: MediaQuery.of(context).size.height/40,
            color: Colors.white
        ),),
      ),
    );
  }
}

