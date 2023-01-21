import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/utils.dart';

class TitleDetailPokemon extends StatelessWidget {
  const TitleDetailPokemon({
    Key? key,
    required this.pokemon,
    required this.mywidgets,
  }) : super(key: key);

  final Pokemon pokemon;
  final List<Widget> mywidgets;
  

  @override
  Widget build(BuildContext context) {

    var genus = pokemon.species?.genera?.where((el) => el?.language?.name == 'en').first?.genus;

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Utils.toCapitalized("${pokemon.name}"),
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: mywidgets)
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '#00${pokemon.id}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  ),
                  Text(
                    "${genus}",
                    style: TextStyle(color: Colors.white54, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
