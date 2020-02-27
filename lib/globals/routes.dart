import 'package:flutter/material.dart';
import 'package:pokemon_flutter/pages/404/not_found_screen.dart';
import 'package:pokemon_flutter/pages/pokemon_details/pokemon_details_screen.dart';
import 'package:pokemon_flutter/pages/pokemons/pokemons_screen.dart';
import 'package:pokemon_flutter/pages/settings/settings_sceen.dart';

Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
  switch (settings.name) {
    case "pokemons":
      return MaterialPageRoute(
          builder: (_) => PokemonsScreen(), settings: settings);
      break;
    case "pokemon-detail":
      return MaterialPageRoute(
          builder: (_) => PokemonDetailScreen(pokemon: settings.arguments),
          settings: settings);
      break;
    case "settings":
      return MaterialPageRoute(
          builder: (_) => SettingsSceen(), settings: settings);
      break;
    default:
      return MaterialPageRoute(
          builder: (_) => NotFoundScreen(), settings: settings);
  }
}
