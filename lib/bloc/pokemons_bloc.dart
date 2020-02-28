import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:pokemon_flutter/classes/pokemon.dart';

class PokemonsBloc {
  String _urlApi = "https://pokeapi.co/api/v2/";
  String _filter;
  StreamController<List<Pokemon>> _streamController;
  StreamController<int> _streamControllerItens;

  Stream<List<Pokemon>> get stream => _streamController.stream;
  Stream<int> get streamItems => _streamControllerItens.stream;

  static final PokemonsBloc instance = PokemonsBloc._();

  factory PokemonsBloc() => instance;

  PokemonsBloc._() {
    _streamController = StreamController.broadcast();
    _streamControllerItens = StreamController.broadcast();
    _filter = null;
  }

  loadPokemons() async {
    try {
      Response response = await get(this._urlApi + "pokemon?limit=1000");
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<Pokemon> pokemons =
            List<Map<String, dynamic>>.from(body['results'])
                .map((pokemon) => Pokemon.fromJson(pokemon))
                .toList();

        if (_filter != null && _filter.isNotEmpty) {
          pokemons.removeWhere((pokemon) =>
              pokemon.name.toLowerCase().indexOf(_filter) == -1);
        }

        _streamController.sink.add(pokemons);
      }
    } catch (e, stackTrace) {
      log(e.toString(), name: "loadPokemons", stackTrace: stackTrace);
      return Future.error(e);
    }
  }

  setFilter(String filter) {
    _filter = filter != null ? filter.toLowerCase() : null;
    loadPokemons();
  }

  dispose() {
    _streamController.close();
    _streamControllerItens.close();
  }
}
