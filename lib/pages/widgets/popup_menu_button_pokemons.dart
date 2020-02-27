import 'package:flutter/material.dart';
import 'package:pokemon_flutter/globals/enum.dart';

class PopupMenuButtonPokemons extends StatelessWidget {
  const PopupMenuButtonPokemons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      onSelected: (PokemonsPopupMenuButtonTypes option) {
        switch (option) {
          case PokemonsPopupMenuButtonTypes.settings:
            Navigator.pushNamed(context, "settings");
            break;
          case PokemonsPopupMenuButtonTypes.notFound:
            Navigator.pushNamed(context, "notFound");
            break;
          default:
        }
      },
      itemBuilder: (BuildContext ctx) {
        return [
          PopupMenuItem(
            value: PokemonsPopupMenuButtonTypes.settings,
            child: Text("Configurações"),
          ),
          PopupMenuItem(
            value: PokemonsPopupMenuButtonTypes.notFound,
            child: Text("Não Encontrado"),
          )
        ];
      },
    );
  }
}
