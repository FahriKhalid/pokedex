import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/pokedex/PokemonController.dart';
import 'package:pokedex/models/pokemon.dart';

class About extends GetView<PokemonController> {
  const About({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon = Get.arguments;

    List abilities = [];
    for (var element in pokemon.abilities!) {
      abilities.add(element?.ability!.name);
    }

    List egg_groups = [];
    for (var element in pokemon.species!.eggGroups!) {
      egg_groups.add(element?.name);
    }

    var desc = pokemon.species?.flavorTextEntries?[0]!.flavorText;
    var desc2 = pokemon.species?.flavorTextEntries?[2]!.flavorText;

    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20, left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
                "${desc!.replaceAll("\n", " ") + " " + desc2!.replaceAll("\n", " ")}"),
            SizedBox(height: 10),
            ListAbout(title: "Seed", value: pokemon.species!.genera![7]!.genus),
            ListAbout(title: "Height", value: pokemon.height.toString()),
            ListAbout(title: "Weight", value: pokemon.weight.toString()),
            ListAbout(title: "Abilities", value: abilities.join(", ")),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class ListAbout extends StatelessWidget {
  const ListAbout({Key? key, this.title, this.value}) : super(key: key);

  final String? title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "${title}",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "${value}",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
