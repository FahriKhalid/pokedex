// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListMenu extends StatelessWidget {
  final Color color;
  final String textMenu;
  final String? nameRoute;
  const ListMenu({Key? key, required this.color, required this.textMenu, this.nameRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Get.toNamed(nameRoute!);
        },
        child: Opacity(
          opacity: 0.8,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: color,
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    child: Opacity(
                      opacity: 0.4,
                      child: Container(
                        child: Image.asset(
                          'assets/images/background/bg.png',
                          fit: BoxFit.contain,
                        ),
                        width: 100,
                      ),
                    ),
                    right: -15,
                    bottom: -35,
                  ),
                  Positioned(
                    child: Opacity(
                      opacity: 0.4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Image.asset(
                          'assets/images/background/bg.png',
                          fit: BoxFit.contain,
                        ),
                        width: 100,
                      ),
                    ),
                    left: -58,
                    top: -87,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          textMenu,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
