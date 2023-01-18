import 'package:get/get.dart';
import 'package:pokedex/controllers/pokedex/PokedexController.dart';
import 'package:pokedex/controllers/pokedex/PokemonController.dart';
import 'package:pokedex/controllers/pokedex/SpeciesController.dart';

class PokedexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PokedexController>(
      () => PokedexController(),
    );
    Get.lazyPut<PokemonController>(
      () => PokemonController(),
    );
    Get.lazyPut<SpeciesController>(
      () => SpeciesController(),
    );
  }
}
