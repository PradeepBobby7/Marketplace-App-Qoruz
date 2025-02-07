import 'package:flutter/material.dart';
import 'package:qoruz_marketplace/screens/market_place.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MarketPlaseScreen(),
    );
  }
}
