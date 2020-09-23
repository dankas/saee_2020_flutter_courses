import 'package:flutter/material.dart';
import 'package:initial_level/models/drink.dart';
import 'package:initial_level/views/pages/candy_details_page.dart';

class DrinkCard extends StatelessWidget {
  final Drink drink;
  final Function onFavorite;

  const DrinkCard(this.drink, this.onFavorite);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DrinkDetailsPage(drink),
                  ),
                );
              },
              child: Hero(
                tag: drink.id,
                child: Image.asset(
                  drink.imagePath,
                  fit: BoxFit.cover,
                  width: constraints.maxWidth,
                  height: constraints.maxWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 16, right: 16, bottom: 8),
              child: Text(
                drink.name,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                drink.description,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8, left: 16, right: 16, bottom: 16),
              child: Row(
                children: [
                  Text(
                    "R\$ ${drink.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: onFavorite,
                    child: Icon(
                      drink.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Theme.of(context).accentColor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
