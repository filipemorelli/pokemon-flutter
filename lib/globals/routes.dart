import 'package:flutter/material.dart';
import 'package:pokemon_flutter/pages/404/not_found_screen.dart';
import 'package:pokemon_flutter/pages/pokemons/pokemons_screen.dart';

Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
  switch (settings.name) {
    case "pokemons":
      return MaterialPageRoute(
          builder: (_) => PokemonsScreen(), settings: settings);
      break;
    default:
      return MaterialPageRoute(
          builder: (_) => NotFoundScreen(), settings: settings);
  }
}
