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
        title: Text("Coffee Store"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/coffee_background.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black,
                  BlendMode.softLight,
                ),
              ),
            ),
            child: Text(
              "Cardápio",
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
