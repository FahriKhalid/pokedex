import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/controllers/pokedex/PokedexController.dart';
import 'package:pokedex/models/list_pokemon.dart';
import 'package:get/get.dart';
import 'package:pokedex/modules/home/screen/components/background_secondary_screen.dart';
import 'package:pokedex/modules/pokedex/components/list_grid_pokedex.dart';

class Pokedex extends GetView<PokedexController> {
  PokedexController pokedexController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_rounded),
            color: Colors.black,
          )
        ],
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Stack(
        children: [
          BackgroundSecondaryScreen(),
          Container(
            margin: EdgeInsets.only(top: 80),
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Pokedex",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 150),
            child: Expanded(
              child: FutureBuilder(
                future: controller.get(null),
                initialData: [],
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text("No data"),
                    );
                  }
                  return Obx(
                    () => Stack(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          padding:
                              EdgeInsets.only(bottom: 60, left: 20, right: 20),
                          controller: controller.scrollController,
                          itemCount: pokedexController.listPokedex.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.4),
                          itemBuilder: (context, index) {
                            Result pokemon =
                                pokedexController.listPokedex[index]!;

                            return AnimationConfiguration.staggeredGrid(
                              position: 10,
                              columnCount: 2,
                              duration: const Duration(milliseconds: 375),
                              child: ScaleAnimation(
                                scale: 0.5,
                                child: FadeInAnimation(
                                    child: ListGridPokedex(item: pokemon)),
                              ),
                            );
                          },
                        ),
                        Positioned(
                          width: Get.width,
                          bottom: 0,
                          child: pokedexController.isNextLoading.value
                              ? const Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              : Container(),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
