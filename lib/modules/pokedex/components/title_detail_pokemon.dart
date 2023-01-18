import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
              Text(
                '#00${pokemon.id}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
