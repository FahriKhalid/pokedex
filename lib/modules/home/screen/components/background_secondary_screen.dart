import 'package:flutter/material.dart';

class BackgroundSecondaryScreen extends StatelessWidget {
  const BackgroundSecondaryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -150,
      top: -160,
      child: Container(
        child: Image.asset(
          'assets/images/background/bg.png',
          fit: BoxFit.contain,
        ),
        width: 320,
      ),
    );
  }
}
