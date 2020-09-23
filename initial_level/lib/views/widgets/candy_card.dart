import 'package:flutter/material.dart';
import 'package:initial_level/models/candy.dart';
import 'package:initial_level/views/pages/candy_details_page.dart';

class CandyCard extends StatelessWidget {
  final Candy candy;
  final Function onFavorite;

  const CandyCard(this.candy, this.onFavorite);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CandyDetailsPage(candy),
                  ),
                );
              },
              child: Image.network(
                candy.imageUrl,
                fit: BoxFit.cover,
                width: constraints.maxWidth,
                height: constraints.maxWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(candy.name),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(candy.price),
                IconButton(
                  icon: Icon(candy.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border),
                  onPressed: onFavorite,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
