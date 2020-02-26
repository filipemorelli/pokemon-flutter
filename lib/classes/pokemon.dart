class Pokemon {
  String id;
  String name;

  Pokemon.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        id = _getId(json["url"]);

  String get nameCapitalize => name[0].toUpperCase() + name.substring(1);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
    };
  }

  String get frontImage =>
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png";

  /// pega o id do pokemom pela url assim reduzindo a quantidade de chamadas na API
  static String _getId(String url) {
    return url
        .replaceAll("https://pokeapi.co/api/v2/pokemon/", "")
        .replaceAll("/", "");
  }
}
