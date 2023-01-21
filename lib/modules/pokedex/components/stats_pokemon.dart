import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokedex/controllers/pokedex/PokemonController.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/utils.dart';

class Stats extends GetView<PokemonController> {
  const Stats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon = Get.arguments;

    List<Widget> stats_widget = [];
    stats_widget.add(SizedBox(height: 10));
    for (var element in pokemon.stats!) {
      stats_widget.add(
        ListStat(
            title: Utils.toCapitalized("${element?.stat!.name}"),
            value: element?.baseStat),
      );
    }

    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20, left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: stats_widget,
        ),
      ),
    );
  }
}

class ListStat extends StatelessWidget {
  const ListStat({Key? key, required this.title, required this.value})
      : super(key: key);

  final String? title;
  final int? value;

  @override
  Widget build(BuildContext context) {
    if (value! < 100) {}

    return Padding(
      padding: const EdgeInsets.only(top: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "${title}",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 23),
              child: Text(
                "${value}",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: LinearPercentIndicator(
                percent: (value! * 0.01) / 2,
                lineHeight: 8,
                backgroundColor: Colors.grey.shade300,
                progressColor: value! < 50
                    ? Colors.red.shade300
                    : (value! >= 50 && value! <= 100
                        ? Colors.amber.shade300
                        : Colors.green.shade300),
                animation: true,
                animationDuration: 700,
                barRadius: Radius.circular(20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
