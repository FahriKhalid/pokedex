import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/constants/contant.dart';
import 'package:pokedex/controllers/pokedex/PokedexController.dart';
import 'package:pokedex/models/list_pokemon.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonController extends GetxController {
  RxList<Result> listPokedex = Get.find<PokedexController>().listPokedex;

  Future<Pokemon?> get(String name) async {
    try {
      if (listPokedex.where((el) => el.name == name).first.pokemon == null) {
        Uri url = Uri.parse(endpoint + "pokemon/" + name);
        var res = await http.get(url);
        Map<String, dynamic> data =
            (json.decode(res.body) as Map<String, dynamic>);
        Pokemon pokemon = Pokemon.fromJson(data);

        if (data.isNotEmpty) {
          Uri urlSpecies =
              Uri.parse('${endpoint}pokemon-species/${pokemon.id}');
          var resSpecies = await http.get(urlSpecies);
          Map<String, dynamic> dataSpecies =
              (json.decode(resSpecies.body) as Map<String, dynamic>);
          Species species = Species.fromJson(dataSpecies);
          pokemon.species = species;

          listPokedex.where((el) => el.name == name).first.pokemon = pokemon;
        }
        return pokemon;
      }
    } catch (e) {
      log("ERROR = ${e}");
    }

    return listPokedex.where((el) => el.name == name).first.pokemon;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    print("LIST = ${listPokedex}");
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
