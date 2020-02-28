import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokemon_flutter/bloc/pokemons_bloc.dart';
import 'package:pokemon_flutter/bloc/search_bloc.dart';
import 'package:pokemon_flutter/classes/pokemon.dart';
import 'package:pokemon_flutter/globals/functions.dart';
import 'package:pokemon_flutter/pages/loading/loading_screen.dart';
import 'package:pokemon_flutter/styles/styles.dart';

class PokemonsScreen extends StatefulWidget {
  @override
  _PokemonsScreenState createState() => _PokemonsScreenState();
}

class _PokemonsScreenState extends State<PokemonsScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  SearchBloc _searchBloc;
  TextEditingController _search;

  @override
  void initState() {
    super.initState();
    PokemonsBloc.instance.loadPokemons();
    _searchBloc = SearchBloc(
      startAppBar: startAppBar(),
      searchAppBar: searchAppBar(),
    );
    _search = TextEditingController();
    _search.addListener(() {
      print(_search.text);
    });
  }

  @override
  void dispose() {
    _searchBloc.dispose();
    super.dispose();
  }

  AppBar searchAppBar() {
    return AppBar(
      title: TextFormField(
        controller: _search,
        autocorrect: true,
        enableSuggestions: true,
        textInputAction: TextInputAction.go,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Search...',
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.white),
        ),
        onSaved: (v) {
          log(v, name: "onSaved");
        },
        onFieldSubmitted: (v) {
          log(v, name: "onFieldSubmitted");
        },
      ),
      leading: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          _searchBloc.setStartAppBar();
        },
      ),
    );
  }

  AppBar startAppBar() {
    return AppBar(
      title: Text("Pokémons"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            _searchBloc.setSearchppBar();
          },
        ),
      ],
    );
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
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, kToolbarHeight),
            child: StreamBuilder<AppBar>(
              initialData: startAppBar(),
              stream: _searchBloc.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SizedBox();
                }
                return snapshot.data;
              },
            ),
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
    return OrientationBuilder(
      builder: (context, orientarion) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientarion == Orientation.portrait) ? 3 : 4,
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
                    scaffoldKey: scaffoldKey,
                    text: pokemons[index].nameCapitalize);
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
      },
    );
  }
}
