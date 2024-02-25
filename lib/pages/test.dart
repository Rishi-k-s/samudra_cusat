import 'package:flutter/material.dart';
import 'package:samudra_ai/pages/chat_page.dart';
import 'package:samudra_ai/pages/eCommerce.dart';
import 'package:samudra_ai/pages/image_chat.dart';

class MainTest extends StatefulWidget {
  const MainTest({super.key});

  @override
  State<MainTest> createState() => _MainTestState();
}

class _MainTestState extends State<MainTest> {
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
        backgroundColor: Color.fromRGBO(156, 230, 255, 0.882),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyFishApp()),
                );
              },
              icon: Icon(Icons.shopping_cart),
              label: Text('Marketplace'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                textStyle: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                padding: EdgeInsets.all(20.0),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatPage()),
                );
              },
              icon: Icon(Icons.chat),
              label: Text('Marine Chat'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                textStyle: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                padding: EdgeInsets.all(20.0),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageChat()),
                );
              },
              icon: Icon(Icons.image),
              label: Text('Marine Detections'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                textStyle: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                padding: EdgeInsets.all(20.0),
              ),
            ),
            // Add more buttons as needed
          ],
        ),
      ),
    );
  }
}
