import 'package:flutter/material.dart';
import 'package:initial_level/controllers/menu_controller.dart';
import 'package:initial_level/views/widgets/drink_grid_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final menuController = MenuController();

  @override
  void initState() {
    menuController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7F8),
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
            child: DrinkGridView(
              drinks: menuController.list,
              onChangeIndexed: (index) {
                setState(
                  () => menuController.toggleCandyFavoriteStatus(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
