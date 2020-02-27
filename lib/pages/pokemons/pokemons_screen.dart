import 'package:flutter/material.dart';
import 'package:pokemon_flutter/bloc/pokemons_bloc.dart';
import 'package:pokemon_flutter/classes/pokemon.dart';
import 'package:pokemon_flutter/globals/functions.dart';
import 'package:pokemon_flutter/styles/styles.dart';

class PokemonsScreen extends StatefulWidget {
  @override
  _PokemonsScreenState createState() => _PokemonsScreenState();
}

class _PokemonsScreenState extends State<PokemonsScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  PokemonsBloc pokemonsBloc;

  @override
  void initState() {
    super.initState();
    pokemonsBloc = PokemonsBloc();
    pokemonsBloc.loadPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Pokémons"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: EdgeInsets.all(kSpaceSize),
          child: StreamBuilder<List<Pokemon>>(
            stream: pokemonsBloc.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return buildPokemonGridList(pokemons: snapshot.data);
            },
          ),
        ),
      ),
    );
  }

  Widget buildPokemonGridList({@required List<Pokemon> pokemons}) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: kSpaceSize,
      crossAxisSpacing: kSpaceSize,
      scrollDirection: Axis.vertical,
      children: pokemons.map((pokemon) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, "pokemon-detail", arguments: pokemon);
          },
          onLongPress: () {
            showToast(scaffoldKey: scaffoldKey, text: pokemon.nameCapitalize);
          },
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            clipBehavior: Clip.antiAlias,
            color: Colors.white,
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black45,
                title: Text(pokemon.nameCapitalize),
              ),
              child: Hero(
                tag: pokemon.name,
                child: Image.network(
                  pokemon.frontImage,
                  scale: 0.5,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
