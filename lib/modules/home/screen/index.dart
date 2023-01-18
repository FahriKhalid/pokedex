import 'package:flutter/material.dart';
import 'package:pokedex/controllers/pokedex/PokedexController.dart';
import 'package:pokedex/models/list_pokemon.dart';
import 'package:get/get.dart';
import 'package:pokedex/modules/home/screen/components/background_home_screen.dart';
import 'package:pokedex/modules/home/screen/components/list_menu.dart';
import 'package:pokedex/modules/pokedex/components/list_grid_pokedex.dart';

class Home extends GetView<PokedexController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundHomeScreen(),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 50),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What Pokemon",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "are you looking for ?",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    autocorrect: false,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 50),
                        prefixIcon: Icon(Icons.search),
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        iconColor: Colors.black,
                        fillColor: Colors.grey[200],
                        filled: true,
                        hintStyle: TextStyle(fontSize: 12),
                        hintText: 'Search Pokemon, Move, Ability Etc'),
                  ),
                  SizedBox(height: 35),
                  Container(
                    width: double.infinity,
                    child: GridView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        ListMenu(
                            color: Colors.green,
                            textMenu: "Pokedex",
                            nameRoute: "pokedex"),
                        ListMenu(color: Colors.red, textMenu: "Moves"),
                        ListMenu(color: Colors.blue, textMenu: "Abilities"),
                        ListMenu(color: Colors.amber, textMenu: "Items"),
                        ListMenu(color: Colors.purple, textMenu: "Locations"),
                        ListMenu(color: Colors.brown, textMenu: "Type Charts"),
                      ],
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 12,
                        crossAxisCount: 2,
                        childAspectRatio: 2.3,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

OutlineInputBorder myinputborder() {
  return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade200),
      //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(30)));
}
