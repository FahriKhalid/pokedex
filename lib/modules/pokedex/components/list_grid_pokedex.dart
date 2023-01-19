import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/pokedex/PokemonController.dart';
import 'package:pokedex/models/list_pokemon.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/routes/app_pages.dart';
import 'package:pokedex/utils/color.dart';
import 'package:pokedex/utils/utils.dart';

class ListGridPokedex extends StatelessWidget {
  final Result item;
  const ListGridPokedex({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokemonController pokemonController = Get.find();

    return FutureBuilder<Pokemon>(
      future: pokemonController.get("${item.url}"),
      builder: (context, snapshot) {
        List<Widget> mywidgets = [];
        Pokemon? pokemon = snapshot.data;

        log("RESULT = ${pokemon?.id}");
        if (pokemon != null) {
          for (var element in pokemon.types!) {
            mywidgets.add(Container(
              margin: EdgeInsets.only(bottom: 6),
              height: 24,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white30),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "${element?.type?.name}",
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
        }

        return Material(
          color: ColorPokemon.set("${pokemon?.species?.color?.name}"),
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              Get.toNamed(Routes.detailPokemon, arguments: pokemon);
            },
            child: Container(
              height: 150,
              child: Stack(
                children: [
                  Positioned(
                    child: Opacity(
                      opacity: 0.4,
                      child: Container(
                        child: Image.asset(
                          'assets/images/background/bg.png',
                          fit: BoxFit.contain,
                        ),
                        width: 100,
                      ),
                    ),
                    right: -5,
                    bottom: -10,
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: CachedNetworkImage(
                      width: 70,
                      height: 70,
                      imageUrl:
                          "${pokemon?.sprites?.other?.officialArtwork?.frontDefault}",
                      placeholder: (context, url) {
                        return Container();
                      },
                      errorWidget: (context, url, error) {
                        return Container();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Utils.toCapitalized("${item.name}"),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: mywidgets,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SvgImageNetwork extends StatelessWidget {
  const SvgImageNetwork({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon? pokemon;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      width: 70,
      "${pokemon?.sprites!.other!.dreamWorld!.frontDefault}",
      placeholderBuilder: (BuildContext context) => Container(
          //child: const CircularProgressIndicator(),
          ),
    );
  }
}
