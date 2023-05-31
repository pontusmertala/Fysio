import 'package:flutter/material.dart';
import 'package:fysio/pages/navpages/bar_item_page.dart';
import 'package:fysio/pages/navpages/home_page.dart';
import 'package:fysio/pages/navpages/my_page.dart';
import 'package:fysio/pages/navpages/ovningar.dart';
import 'package:fysio/pages/navpages/search_page.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
    Ovningar(),
    

  ];

  int currentIndex=0;


  void onTap(int index){
    setState(() {
      currentIndex = index;
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items:[
          BottomNavigationBarItem(label: ("Övningar"),icon: const Icon(Icons.apps)),
          BottomNavigationBarItem(label: ("Boka tid"),icon: const Icon(Icons.message)),
          BottomNavigationBarItem(label: ("Home"),icon: const Icon(Icons.home_rounded)),
          BottomNavigationBarItem(label: ("Notiser"),icon: const Icon(Icons.notifications)),
          BottomNavigationBarItem(label: ("Inställningar"),icon: const Icon(Icons.settings)),

        ],
      ),
    );
  }
}