import 'package:flutter/material.dart';

void main() {
  runApp(MyFishApp());
}

class Fish {
  String name;
  String image;
  double price;
  String quality;

  Fish(this.name, this.image, this.price, this.quality);
}

class MyFishApp extends StatelessWidget {
  final List<Fish> fishList = [
    Fish('Tuna', 'assets/tuna.jpg', 280, 'High Quality'),
    Fish('Salmon', 'assets/salmon.jpg', 300, 'Medium Quality'),
    Fish('Mackerel','assets/mackerel.jpg',260,'High Quality'),
    // Add more fish items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fish Market'),
        ),
        body: ListView.builder(
          itemCount: fishList.length,
          itemBuilder: (context, index) {
            return FishItem(fishList[index]);
          },
        ),
      ),
    );
  }
}

class FishItem extends StatelessWidget {
  final Fish fish;

  FishItem(this.fish);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          fish.image,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(fish.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price: \$${fish.price.toString()}'),
            Text('Quality: ${fish.quality}'),
          ],
        ),
        onTap: () {
          // Handle tap to view more details or make a purchase
          // You can navigate to a new screen or show a dialog, for example
        },
      ),
    );
  }
}
