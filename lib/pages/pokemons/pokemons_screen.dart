import 'package:flutter/material.dart';
import 'package:pokemon_flutter/bloc/pokemons_bloc.dart';
import 'package:pokemon_flutter/classes/pokemon.dart';
import 'package:pokemon_flutter/globals/functions.dart';
import 'package:pokemon_flutter/pages/loading/loading_screen.dart';
import 'package:pokemon_flutter/pages/widgets/popup_menu_button_pokemons.dart';
import 'package:pokemon_flutter/styles/styles.dart';

class PokemonsScreen extends StatefulWidget {
  @override
  _PokemonsScreenState createState() => _PokemonsScreenState();
}

class _PokemonsScreenState extends State<PokemonsScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    PokemonsBloc.instance.loadPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Pokemon>>(
      stream: PokemonsBloc.instance.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoadingScreen();
        }
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text("Pokémons"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              PopupMenuButtonPokemons()
            ],
          ),
          body: SafeArea(
            bottom: false,
            child: Scrollbar(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: kSpaceSize),
                child: buildPokemonGridList(pokemons: snapshot.data),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildPokemonGridList({@required List<Pokemon> pokemons}) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: kSpaceSize,
        crossAxisSpacing: kSpaceSize,
      ),
      itemCount: pokemons.length,
      itemBuilder: (ctx, index) {
        print(index);
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, "pokemon-detail",
                arguments: pokemons[index]);
          },
          onLongPress: () {
            showToast(
                scaffoldKey: scaffoldKey, text: pokemons[index].nameCapitalize);
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
                title: Text(pokemons[index].nameCapitalize),
              ),
              child: Hero(
                tag: pokemons[index].name,
                child: Image.network(
                  pokemons[index].frontImage,
                  scale: 0.5,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
