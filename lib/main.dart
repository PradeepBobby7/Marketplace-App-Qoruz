import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoruz_marketplace/api/api_service.dart';
import 'package:qoruz_marketplace/bloc/marketplace_bloc.dart';

import 'screens/market_place.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MarketplaceBloc>(
            create: (context) => MarketplaceBloc(
              apiService: ApiService(),
            ),
          )
        ],
        child: const MarketPlascreen(),
      ),
    );
  }
}
