import 'package:flutter/material.dart';
import 'package:samudra_ai/pages/test.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Samudra"), centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 30.0,
          color: Color.fromARGB(255, 12, 57, 124),
          fontWeight: FontWeight.bold
        ),
      
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the 'abcd' page when the floating button is clicked
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MainTest()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 12, 57, 124),
        child: const Icon(Icons.navigate_next),
      ),

    );
  }
}