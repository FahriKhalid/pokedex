import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/models/pokemon.dart';

class Moves extends StatelessWidget {
  const Moves({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon = Get.arguments;

    List<DataRow> rows_widget = [];

    for (var i = 0; i < pokemon.moves!.length; i++) {
      var element = pokemon.moves![i];
      rows_widget.add(DataRow(cells: [
        DataCell(Text('${i + 1}')),
        DataCell(Text('${element?.move?.name}'))
      ]));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: Get.width,
          child: DataTable(
              dataRowColor: MaterialStateColor.resolveWith(
                  (states) => Colors.grey.shade200),
              dividerThickness: 0,
              columnSpacing: 23,
              columns: [
                DataColumn(
                  numeric: true,
                  label: Text('No'),
                ),
                DataColumn(
                  label: Text('Move'),
                ), 
              ],
              rows: rows_widget),
        ),
      ),
    );
  }
}
