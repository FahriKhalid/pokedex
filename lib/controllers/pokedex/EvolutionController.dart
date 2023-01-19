import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/constants/contant.dart';
import 'package:pokedex/models/evolution.dart';
import 'package:pokedex/models/pokemon.dart';

class EvolutionController extends GetxController {
  RxBool isLoading = false.obs;
  Evolution evolution = Evolution();

  RxString imgEvolution1 = "".obs;
  RxString imgEvolution2 = "".obs;
  RxString imgEvolution3 = "".obs;

  Future<void> get(String link) async {
    try {
      Uri url = Uri.parse(link);
      var res = await http.get(url);
      Map<String, dynamic> data =
          (json.decode(res.body) as Map<String, dynamic>);
      evolution = Evolution.fromJson(data);

      evolution.chain?.species!.image =
          await findPokemon("${evolution.chain?.species!.name}");

      evolution.chain!.evolvesTo?[0]!.species!.image =
          await findPokemon("${evolution.chain!.evolvesTo?[0]!.species!.name}");

      if (evolution.chain!.evolvesTo?[0]!.evolvesTo != null) {
        evolution.chain!.evolvesTo?[0]!.evolvesTo?[0]!.species!.image =
            await findPokemon(
                "${evolution.chain!.evolvesTo?[0]!.evolvesTo?[0]!.species!.name}");
      }

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  findPokemon(String link) async {
    Uri url = Uri.parse(endpoint + 'pokemon/' + link);
    var res = await http.get(url);
    Map<String, dynamic> data = (json.decode(res.body) as Map<String, dynamic>);
    Pokemon pokemon = Pokemon.fromJson(data);
    return pokemon.sprites?.other!.officialArtwork!.frontDefault;
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
