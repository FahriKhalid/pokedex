import 'package:get/get.dart';
import 'package:pokedex/bindings/HomeBinding.dart';
import 'package:pokedex/bindings/PokedexBinding.dart';
import 'package:pokedex/modules/home/screen/index.dart';
import 'package:pokedex/modules/pokedex/screens/detail.dart';
import 'package:pokedex/modules/pokedex/screens/index.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.pokedex,
      page: () => Pokedex(),
      binding: PokedexBinding(),
    ),
    GetPage(
      name: _Paths.detailPokemon,
      page: () => DetailPokemon(),
      binding: PokedexBinding(),
    ),
  ];
}
