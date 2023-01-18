import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/contant.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/list_pokemon.dart';

class PokedexController extends GetxController {
  RxBool isNextLoading = false.obs;

  ScrollController scrollController = ScrollController();
  RxList<Result> listPokedex = List<Result>.empty().obs;
  ListPokemon pokedex = ListPokemon();

  Future<List<Result?>> get(String? link) async {
    Uri url;

    try {
      if (link == null) {
        url = Uri.parse(endpoint + "pokemon");
      } else {
        url = Uri.parse(link);
      }

      var res = await http.get(url);
      Map<String, dynamic> data =
          (json.decode(res.body) as Map<String, dynamic>);
      ListPokemon listPokemon = ListPokemon.fromJson(data);
      List<Result?>? result = listPokemon.results;

      for (var element in result!) {
        listPokedex.add(element!);
      }

      pokedex = listPokemon; 
      isNextLoading.value = false;
      return result;
    } catch (e) {
      isNextLoading.value = false;
      return listPokedex;
    }
  }

  // For Pagination
  void paginateTask() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        log("${pokedex.next}");
        isNextLoading.value = true;
        await get(pokedex.next);
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    paginateTask();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
