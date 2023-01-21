import 'package:pokedex/models/pokemon.dart';

class ListPokemon {
  ListPokemon({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  String? next;
  dynamic previous;
  List<Result?>? results;

  factory ListPokemon.fromJson(Map<String, dynamic> json) => ListPokemon(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<Result?>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x!.toJson())),
      };
}

class Result {
  Result({
    this.name,
    this.url,
    this.pokemon,
  });

  String? name;
  String? url;
  Pokemon? pokemon;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
        pokemon: null
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "pokemon" : pokemon!.toJson()
      };
}
