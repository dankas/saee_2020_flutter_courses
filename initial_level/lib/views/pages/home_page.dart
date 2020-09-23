import 'package:flutter/material.dart';
import 'package:initial_level/controllers/candy_controller.dart';
import 'package:initial_level/views/widgets/candies_grid_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final candyController = CandyController();

  @override
  void initState() {
    candyController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu App"),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF163344),
                  Colors.blue,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Text(
              "Doces",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          Flexible(
            child: CandiesGridView(
              candies: candyController.list,
              onChangeIndexed: (index) {
                setState(
                  () => candyController.toggleCandyFavoriteStatus(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
