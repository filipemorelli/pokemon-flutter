import 'package:flutter/material.dart';
import 'package:pokemon_flutter/classes/pokemon.dart';

class PokemonDetailScreen extends StatefulWidget {
  final Pokemon pokemon;

  PokemonDetailScreen({@required this.pokemon});

  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.nameCapitalize),
        centerTitle: true,
      ),
      body: Center(
        child: Text(widget.pokemon.nameCapitalize),
      ),
    );
  }
}
