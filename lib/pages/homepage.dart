import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/models.dart';

class HomePage extends StatefulWidget {
  static const String id = 'homepage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var posts;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _deletePost(String documentId) async {

      var currentUser = _auth.currentUser;
      var postAuthor = await FirebaseFirestore.instance.collection('posts').doc(documentId).get().then((doc) => doc['author']);
      if (currentUser != null && currentUser.email == postAuthor) {
        await FirebaseFirestore.instance.collection('posts').doc(documentId).delete();
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
        title: Text(
          'Home',
          style: GoogleFonts.capriola(
            fontSize: MediaQuery.of(context).size.height / 25,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('posts').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  posts = snapshot.data!.docs.map((doc) => blogModel(
                    id: doc.id,
                    content: doc['content'],
                    author: doc['author'],
                    timestamp: doc['timestamp'],
                  )).toList();

                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      var post = posts[index];
                      var currentUser = _auth.currentUser;

                      // Check if the post belongs to the current user
                      bool isCurrentUserAuthor = currentUser != null && currentUser.email == post.author;
                      return Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height / 20,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.height / 30,
                              left: MediaQuery.of(context).size.height / 30,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: MediaQuery.of(context).size.height / 40,),
                                Row(
                                  children: [
                                    SizedBox(width: MediaQuery.of(context).size.width / 30,),
                                    Icon(Icons.person),
                                    SizedBox(width: MediaQuery.of(context).size.width / 30,),
                                    Text(post.author, style: GoogleFonts.capriola(
                                      fontSize: MediaQuery.of(context).size.height / 40, color: Colors.grey,
                                    )),
                                  ],
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height / 30,),
                                Container(
                                  margin: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.height / 30,
                                    left: MediaQuery.of(context).size.height / 30,
                                  ),
                                  child: Text(post.content, style: GoogleFonts.capriola(
                                    fontSize: MediaQuery.of(context).size.height / 30, color: Colors.black,
                                  )),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    SizedBox(width: MediaQuery.of(context).size.width / 30,),
                                    Text('${post.timestamp}', style: GoogleFonts.capriola(
                                      fontSize: MediaQuery.of(context).size.height / 40, color: Colors.grey,
                                    )),
                                    Spacer(),
                                    if (isCurrentUserAuthor)
                                      IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          _deletePost(post.id);
                                        },
                                      )
                                  ],
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height / 50,),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  );
                } else {
                  return Text('');
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
