import 'package:flutter/material.dart';
import 'package:initial_level/models/drink.dart';
import 'package:initial_level/views/widgets/drink_card.dart';

class DrinkGridView extends StatelessWidget {
  final List<Drink> drinks;
  final void Function(int) onChangeIndexed;

  const DrinkGridView({
    this.drinks,
    this.onChangeIndexed,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.606,
      ),
      itemBuilder: (context, index) => DrinkCard(
        drinks[index],
        () => onChangeIndexed(index),
      ),
      itemCount: drinks.length,
    );
  }
}
