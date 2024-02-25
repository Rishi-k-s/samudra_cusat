import 'package:flutter/material.dart';
import 'package:samudra_ai/pages/chat_page.dart';
import 'package:samudra_ai/pages/mainUI.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: ChatPage(),
      home: HomeMain(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.blue.shade200,
      ),
    );
  }
}
