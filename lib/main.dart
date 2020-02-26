import 'package:flutter/material.dart';
import 'package:pokemon_flutter/globals/constants.dart';
import 'package:pokemon_flutter/globals/routes.dart';
import 'package:pokemon_flutter/styles/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemons Flutter',
      theme: kThemeData,
      debugShowMaterialGrid: debugShowMaterialGrid,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      navigatorKey: navigatorKey,
      initialRoute: "pokemons",
      onGenerateRoute: onGeneratedRoutes,
    );
  }
}
