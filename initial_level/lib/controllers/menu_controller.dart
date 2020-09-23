import 'package:initial_level/models/drink.dart';

class MenuController {
  List<Drink> list = [];

  void init() {
    list = [
      Drink(
        id: 0,
        imagePath: "assets/8192.jpg",
        name: "Café Curto",
        price: 2.5,
        description:
            "É preparado na máquina de expresso, trazendo excelentes características de corpo e sabor, já que mantém boa parte dos óleos essenciais provenientes da planta, por conta do mais rápido contato com a água, sob pressão. Ocupa de 25 a 35 ml da xícara de 50 ml em que é servido, e tradicionalmente é chamado, simplesmente, de café expresso.",
        isFavorite: false,
      ),
      Drink(
        id: 1,
        imagePath: "assets/OGDRVD0.jpg",
        name: "Cappuccino",
        price: 3.5,
        description:
            "Um cappuccino clássico, muito famoso no Brasil e consiste em um terço de café expresso, um terço de leite vaporizado e um terço de espuma de leite vaporizado.",
        isFavorite: false,
      ),
    ];
  }

  void toggleCandyFavoriteStatus(index) {
    list[index].isFavorite = !list[index].isFavorite;
  }
}
