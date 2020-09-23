import 'package:initial_level/models/candy.dart';

class CandyController {
  List<Candy> list = [];

  void init() {
    list = [
      Candy(
        imageUrl:
            "https://s2.glbimg.com/115DQucrWsNOUxf_ncmMUisprZI=/0x0:1080x819/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_e84042ef78cb4708aeebdf1c68c6cbd6/internal_photos/bs/2020/w/a/cB6VP5QoOByFKEuCleIQ/jonreceitas-109758346-416338779271002-5424220606850697813-n.jpg",
        name: "Pudim",
        price: 10,
        description: "Um pudim muito bom. :)",
        isFavorite: true,
      ),
      Candy(
        imageUrl:
            "https://s2.glbimg.com/115DQucrWsNOUxf_ncmMUisprZI=/0x0:1080x819/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_e84042ef78cb4708aeebdf1c68c6cbd6/internal_photos/bs/2020/w/a/cB6VP5QoOByFKEuCleIQ/jonreceitas-109758346-416338779271002-5424220606850697813-n.jpg",
        name: "Pudim",
        price: 10,
        description: "Um pudim muito bom. :)",
        isFavorite: false,
      ),
    ];
  }

  void toggleCandyFavoriteStatus(index) {
    list[index].isFavorite = !list[index].isFavorite;
  }
}
