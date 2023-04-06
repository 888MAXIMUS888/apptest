import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;
  final String backgroundImage;
  const MainScaffold(
      {required this.child, required this.backgroundImage, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [SvgPicture.asset(backgroundImage), child],
      ),
    );
  }
}
