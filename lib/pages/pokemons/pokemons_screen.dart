import 'package:flutter/material.dart';
import 'package:pokemon_flutter/globals/functions.dart';
import 'package:pokemon_flutter/styles/styles.dart';

class PokemonsScreen extends StatefulWidget {
  @override
  _PokemonsScreenState createState() => _PokemonsScreenState();
}

class _PokemonsScreenState extends State<PokemonsScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

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
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: kSpaceSize,
            crossAxisSpacing: kSpaceSize,
            scrollDirection: Axis.vertical,
            children: List.generate(100, (index) {
              return InkWell(
                onTap: () {},
                onLongPress: () {
                  showToast(scaffoldKey: scaffoldKey, text: "Item: $index");
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
                      title: Text("Item $index"),
                    ),
                    child: Image.network(
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$index.png",
                      scale: 0.5,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
