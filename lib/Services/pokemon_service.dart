import 'package:get/get.dart'; 

class PokemonService extends GetConnect {

  Future<Response> find(String url) {
    return get(url);
  }
  
}
