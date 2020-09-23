import 'package:flutter/material.dart';
import 'package:initial_level/views/pages/home_page.dart';

void main() => runApp(MeuApp());

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF163344),
      ),
      home: HomePage(),
    );
  }
}
