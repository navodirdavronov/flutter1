import 'package:flutter/material.dart';
import 'package:flutter1/pages/card_list_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card List Demo',
      home: CardListPage(), // Start with the CardListPage
    );
  }
}
