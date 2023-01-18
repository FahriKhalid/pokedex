// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:pokedex/constants/contant.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokedex/models/list_pokemon.dart';

void main() async {
  Uri url = Uri.parse(endpoint + "pokemon");
  var res = await http.get(url);

  Map<String, dynamic> data = (json.decode(res.body) as Map<String, dynamic>);

  ListPokemon listPokemon = ListPokemon.fromJson(data);

  List<Result?>? result = listPokemon.results;

  print("RESULT = ${result![0]?.name}");
}
