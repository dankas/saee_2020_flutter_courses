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
      body: LayoutBuilder(
        builder: (builder, constraints) => Column(
          children: [
            Hero(
              tag: candy.id,
              child: Image.network(
                candy.imageUrl,
                width: constraints.maxWidth,
                height: constraints.maxWidth,
                fit: BoxFit.fitHeight,
                alignment: Alignment.center,
              ),
            ),
            Container(
              height: constraints.maxHeight - constraints.maxWidth - 32,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Theme.of(context).accentColor,
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        candy.name,
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "R\$ ${candy.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          candy.description,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
