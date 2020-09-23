import 'package:flutter/material.dart';
import 'package:initial_level/models/candy.dart';
import 'package:initial_level/views/widgets/candy_card.dart';

class CandiesGridView extends StatelessWidget {
  final List<Candy> candies;
  final void Function(int) onChangeIndexed;

  const CandiesGridView({
    this.candies,
    this.onChangeIndexed,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.606,
      ),
      itemBuilder: (context, index) => CandyCard(
        candies[index],
        () => onChangeIndexed(index),
      ),
      itemCount: candies.length,
    );
  }
}
