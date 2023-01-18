import 'dart:convert';
import 'package:get/get.dart'; 
import 'package:http/http.dart' as http;
import 'package:pokedex/constants/contant.dart'; 
import 'package:pokedex/models/species.dart';

class SpeciesController extends GetxController {

  Future<Species> get(String id) async {
    Uri url = Uri.parse(endpoint + 'pokemon-species/'+id);
    var res = await http.get(url);
    Map<String, dynamic> data = (json.decode(res.body) as Map<String, dynamic>); 


    Species species = Species.fromJson(data);

    return species;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
