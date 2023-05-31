import 'package:flutter/material.dart';
import 'package:fysio/pages/navpages/mainpage.dart';

void main() {

 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return const MaterialApp(
           title: "Fysio",

           home: Mainpage()
         );
    }
} 
