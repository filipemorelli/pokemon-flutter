import 'package:cached_network_image/cached_network_image.dart';
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
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.blue.shade200,
          child: Stack(
            children: <Widget>[
              Card(
                color: Colors.white,
                elevation: 5,
                margin:
                    EdgeInsets.only(top: 100, left: 15, right: 15, bottom: 30),
                child: Center(
                  child: Text(widget.pokemon.nameCapitalize),
                ),
              ),
              Positioned(
                top: 15,
                left: (MediaQuery.of(context).size.width - 192) / 2,
                child: Hero(
                  tag: widget.pokemon.name,
                  child: Image.network(
                    widget.pokemon.frontImage,
                    scale: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
