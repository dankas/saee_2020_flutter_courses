import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map> _mercadorias;

  List<int> _quantidades;

  @override
  void initState() {
    _mercadorias = [
      {
        "title": "Pão cacetinho",
        "description": "Um pão branco e delicioso.",
        "price": 0.50,
        "imageUrl":
            "https://p2.trrsf.com/image/fget/cf/940/0/images.terra.com/2018/10/22/pao-branco-pode.jpg"
      },
      {
        "title": "Pão com grãos",
        "description": "Um pão saudável.",
        "price": 1.0,
        "imageUrl":
            "https://portal-amb-imgs.clubedaana.com.br/2018/11/P%C3%A3o-de-gr%C3%A3os-ana-maria-600x400.jpg"
      },
      {
        "title": "Pão com gergelim",
        "description":
            "Ótimo para fazer hamburguer, e ficar ciscando gergelim depois.",
        "price": 1.0,
        "imageUrl":
            "https://www.congebras.com.br/wp-content/uploads/2018/07/10854-1024x660.jpg"
      },
      {
        "title": "Pão australiano",
        "description": "Um pão doce com cacau.",
        "price": 2.50,
        "imageUrl":
            "https://s2.glbimg.com/3cbQ98gqhTsNAfvhhZ-R2o3s3D4=/0x0:652x434/984x0/smart/filters:strip_icc()/g.glbimg.com/og/gs/gsat5/f/thumbs/materia/2019/04/08/1553872667808-IMG_9965.jpg"
      },
      {
        "title": "Coca cola",
        "description": "Uma garrafa de 2l de um líquido preto.",
        "price": 8.50,
        "imageUrl":
            "https://trimais.vteximg.com.br/arquivos/ids/995447-1000-1000/foto_original.jpg?v=637284348483970000"
      },
    ];
    _quantidades = List<int>.generate(_mercadorias.length, (_) => 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu carrinho"),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: _mercadorias.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_mercadorias[index]['title'],
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                subtitle: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          if (_quantidades[index] > 0)
                            setState(() {
                              _quantidades[index]--;
                            });
                        }),
                    Text(_quantidades[index].toString()),
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            _quantidades[index]++;
                          });
                        })
                  ],
                ),
                trailing: Text(
                  "R\$ ${_mercadorias[index]['price'].toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                leading: Hero(
                  tag: index,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PaginaMercadoria(
                            descricao: _mercadorias[index]['description'],
                            nome: _mercadorias[index]['title'],
                            imageUrl: _mercadorias[index]['imageUrl'],
                            tag: index,
                          ),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage(_mercadorias[index]['imageUrl']),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            color: Colors.grey,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Total: R\$ ${_calculoConta()}",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                RaisedButton(
                  child: Text('Pagar'),
                  onPressed: () {
                    for (int i = 0; i < _quantidades.length; i++)
                      _quantidades[i] = 0;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  String _calculoConta() {
    double sum = 0;
    for (int i = 0; i < _quantidades.length; i++)
      sum += _quantidades[i] * _mercadorias[i]['price'];
    return sum.toStringAsFixed(2);
  }
}

class PaginaMercadoria extends StatelessWidget {
  final String nome;
  final String descricao;
  final String imageUrl;
  final int tag;

  PaginaMercadoria({this.nome, this.descricao, this.imageUrl, this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre $nome"),
      ),
      body: Column(
        children: [
          Hero(tag: tag, child: Image.network(imageUrl)),
          SizedBox(
            height: 10,
          ),
          Text("Descrição: "),
          Text(descricao)
        ],
      ),
    );
  }
}
