import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokedex/controllers/pokedex/EvolutionController.dart';
import 'package:pokedex/controllers/pokedex/PokemonController.dart';
import 'package:pokedex/models/evolution.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/utils.dart';

class Evolution extends GetView<EvolutionController> {
  const Evolution({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon = Get.arguments;

    return FutureBuilder(
        future: controller.get("${pokemon.species?.evolutionChain!.url}"),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Widget> list_evolution = [];
          var evolution = controller.evolution.chain!.evolvesTo;

          if (controller.evolution.chain != null) {
            if (evolution!.isNotEmpty) {
              String? from = controller.evolution.chain!.species!.name;
              String? image_from = controller.evolution.chain!.species!.image;
              String? to = evolution![0]!.species!.name;
              String? image_to = evolution![0]!.species!.image;
              int? level = evolution?[0]!.evolutionDetails?[0]!.minLevel;
              list_evolution.add(listEvolution(
                  from: from,
                  image_from: image_from,
                  level: level,
                  to: to,
                  image_to: image_to));

              if (controller
                  .evolution.chain!.evolvesTo![0]!.evolvesTo!.isNotEmpty) {
                String? from = evolution![0]!.species!.name;
                String? image_from = evolution![0]!.species!.image;

                String? to = evolution![0]!.evolvesTo![0]!.species!.name;
                String? image_to = evolution![0]!.evolvesTo![0]!.species!.image;

                int? level = evolution?[0]!
                    .evolvesTo?[0]!
                    .evolutionDetails?[0]!
                    .minLevel;

                list_evolution.add(new Divider(
                  color: Colors.grey.shade200,
                  thickness: 2,
                ));

                list_evolution.add(listEvolution(
                    from: from,
                    image_from: image_from,
                    level: level,
                    to: to,
                    image_to: image_to));
              }
            }
          }

          return SingleChildScrollView(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: list_evolution,
            ),
          );
        });
  }
}

class listEvolution extends StatelessWidget {
  const listEvolution(
      {Key? key,
      required this.from,
      required this.image_from,
      required this.level,
      required this.to,
      required this.image_to})
      : super(key: key);

  final String? from;
  final String? image_from;
  final int? level;
  final String? to;
  final String? image_to;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Stack(children: [
                  backgrounPokemonEvolution(),
                  CachedNetworkImage(
                    width: 70,
                    height: 70,
                    imageUrl: "${image_from}",
                    placeholder: (context, url) {
                      return Container();
                    },
                    errorWidget: (context, url, error) {
                      return Container();
                    },
                  ),
                ]),
                Align(
                  alignment: Alignment.center,
                  child: Text("${from}"),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Icon(
                    Icons.keyboard_double_arrow_right,
                    color: Colors.grey.shade300,
                  ),
                  Text(
                    "Lvl ${level == null ? '?' : level}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Stack(children: [
                  backgrounPokemonEvolution(),
                  CachedNetworkImage(
                    width: 70,
                    height: 70,
                    imageUrl: "${image_to}",
                    placeholder: (context, url) {
                      return Container();
                    },
                    errorWidget: (context, url, error) {
                      return Container();
                    },
                  ),
                ]),
                Align(
                  alignment: Alignment.center,
                  child: Text("${to}"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class backgrounPokemonEvolution extends StatelessWidget {
  const backgrounPokemonEvolution({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Opacity(
        opacity: 0.8,
        child: Container(
          child: Image.asset(
            'assets/images/background/bg.png',
            fit: BoxFit.contain,
          ),
          width: 80,
        ),
      ),
    );
  }
}
