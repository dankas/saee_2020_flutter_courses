import 'package:flutter/material.dart';
import 'package:initial_level/models/candy.dart';

class CandyDetailsPage extends StatelessWidget {
  final Candy candy;
  const CandyDetailsPage(this.candy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(candy.name),
      ),
      body: Image.network(candy.imageUrl),
    );
  }
}
