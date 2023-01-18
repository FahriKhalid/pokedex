import 'package:flutter/material.dart';

class BackgroundHomeScreen extends StatelessWidget {
  const BackgroundHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -150,
      top: -240,
      child: Container(
        child: Image.asset(
          'assets/images/background/bg.png',
          fit: BoxFit.contain,
        ),
        width: 340,
      ),
    );
  }
}
