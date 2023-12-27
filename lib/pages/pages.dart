import 'package:blogging/pages/homepage.dart';
import 'package:blogging/pages/profile_page.dart';
import 'package:flutter/material.dart';

import 'createpage.dart';

class allPages extends StatefulWidget {
  static const String id = 'pages';
  const allPages({Key? key}) : super(key: key);

  @override
  State<allPages> createState() => _allPagesState();
}

class _allPagesState extends State<allPages> {
  PageController? controller;
  int selected = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        onPageChanged: (int index){
          selected = index;
        },
        children: [
          HomePage(),
          CreatePage(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home_filled,color: Colors.black,),
              icon: Icon(Icons.home_filled,color: Colors.grey,),label: ''),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.create_sharp,color: Colors.black,),
              icon: Icon(Icons.create_sharp,color: Colors.grey,),label: ''),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.person,color: Colors.black,),
              icon: Icon(Icons.person,color: Colors.grey,),label: ''),
        ],
        currentIndex: selected,
        onTap: (int index){
          setState(() {
            selected = index;
            controller?.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          });
        },
      ),
    );
  }
}
