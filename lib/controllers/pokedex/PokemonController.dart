import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/constants/contant.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/species.dart' as species_pokemon;

class PokemonController extends GetxController {
  Pokemon header = Pokemon();

  Future<Pokemon> get(String link) async {
    Uri url = Uri.parse(link);
    var res = await http.get(url);
    Map<String, dynamic> data = (json.decode(res.body) as Map<String, dynamic>);

    Pokemon pokemon = Pokemon.fromJson(data);

    if (data.isNotEmpty) {
      try {
        Uri urlSpecies = Uri.parse('${endpoint}pokemon-species/${pokemon.id}');
        var resSpecies = await http.get(urlSpecies);
        Map<String, dynamic> dataSpecies =
            (json.decode(resSpecies.body) as Map<String, dynamic>);

        species_pokemon.Species species =
            species_pokemon.Species.fromJson(dataSpecies);
        pokemon.species?.color = species.color?.name;
      } catch (e) {
        log("HEADER ERROR = ${e}");
      }
    }

    header = pokemon;
    return pokemon;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
