import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/controllers/pokedex/PokedexController.dart';
import 'package:get/get.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/modules/pokedex/components/evolution_pokemon.dart';
import 'package:pokedex/modules/pokedex/components/stats_pokemon.dart';
import 'package:pokedex/modules/pokedex/components/title_detail_pokemon.dart';
import 'package:pokedex/utils/color.dart';
import 'package:pokedex/modules/pokedex/components/about_pokemon.dart';
import 'package:pokedex/modules/pokedex/components/moves_pokemon.dart';

class DetailPokemon extends GetView<PokedexController> {
  final Pokemon pokemon = Get.arguments;

  @override
  Widget build(BuildContext context) {
    List<Widget> mywidgets = [];

    //controller.startAnimaation();

    for (var element in pokemon.types!) {
      mywidgets.add(Container(
        margin: EdgeInsets.only(bottom: 6, right: 10),
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white30),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                "${element!.type!.name}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
      ));
    }

    // late final Animation<double> _animation = CurvedAnimation(
    //   parent: controller.animationController,
    //   curve: Curves.linear,
    // );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border_outlined),
            color: Colors.white,
          )
        ],
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Container(
        color: ColorPokemon.set("${pokemon.species!.color!.name}"),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: 180,
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  width: Get.width - 130,
                  'assets/images/background/bg.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            TitleDetailPokemon(pokemon: pokemon, mywidgets: mywidgets),
            Container(
              width: Get.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              height: Get.height / 2 + 15,
            ),
            ImagePokemon(pokemon: pokemon),
            TabPokemon(pokemon: pokemon),
          ],
        ),
      ),
    );
  }
}

class TabPokemon extends StatelessWidget {
  const TabPokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 14),
        child: DefaultTabController(
          length: 4,
          initialIndex: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TabBar(
                labelPadding: EdgeInsets.symmetric(horizontal: 20),
                isScrollable: true,
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                indicatorColor:
                    ColorPokemon.set("${pokemon.species!.color!.name}"),
                tabs: [
                  Tab(
                    height: 70,
                    text: "About",
                  ),
                  Tab(
                    height: 70,
                    text: "Base Stats",
                  ),
                  Tab(
                    height: 70,
                    text: "Evolution",
                  ),
                  Tab(
                    height: 70,
                    text: "Moves",
                  )
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  About(),
                  Stats(),
                  Evolution(),
                  Moves(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImagePokemon extends StatelessWidget {
  const ImagePokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: (Get.height / 2) - 600,
      bottom: 0,
      child: Hero(
        tag: 1,
        child: CachedNetworkImage(
          width: (Get.width / 2) + 60,
          imageUrl: "${pokemon.sprites!.other!.officialArtwork!.frontDefault}",
          placeholder: (context, url) {
            return Container();
          },
          errorWidget: (context, url, error) {
            return Container();
          },
        ),
      ),
    );
  }
}
