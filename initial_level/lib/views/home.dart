import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Candy> candies = [
    Candy(
      imageUrl:
          "https://s2.glbimg.com/115DQucrWsNOUxf_ncmMUisprZI=/0x0:1080x819/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_e84042ef78cb4708aeebdf1c68c6cbd6/internal_photos/bs/2020/w/a/cB6VP5QoOByFKEuCleIQ/jonreceitas-109758346-416338779271002-5424220606850697813-n.jpg",
      name: "Pudim",
      price: "R\$10.00",
      isFavorite: true,
    ),
    Candy(
      imageUrl:
          "https://s2.glbimg.com/115DQucrWsNOUxf_ncmMUisprZI=/0x0:1080x819/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_e84042ef78cb4708aeebdf1c68c6cbd6/internal_photos/bs/2020/w/a/cB6VP5QoOByFKEuCleIQ/jonreceitas-109758346-416338779271002-5424220606850697813-n.jpg",
      name: "Pudim",
      price: "R\$10.00",
      isFavorite: false,
    ),
  ];

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
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.606,
              ),
              itemBuilder: _geradorDeCard,
              itemCount: candies.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _geradorDeCard(context, index) => CandyCard(candies[index], () {
        setState(() {
          candies[index].isFavorite = !candies[index].isFavorite;
        });
      });
}

class Candy {
  String imageUrl;
  String price;
  String name;
  bool isFavorite;

  Candy({
    this.imageUrl,
    this.isFavorite,
    this.name,
    this.price,
  });
}

class CandyCard extends StatelessWidget {
  final Candy candy;
  final Function onFavorite;

  CandyCard(this.candy, this.onFavorite);

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
                    builder: (context) => CandyPage(candy),
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

class CandyPage extends StatelessWidget {
  final Candy candy;
  CandyPage(this.candy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(candy.name),
      ),
      body: Image.network(candy.imageUrl),
    );
  }
}
