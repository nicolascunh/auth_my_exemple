import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  static const padding = EdgeInsets.symmetric(horizontal: 16, vertical: 20);

  static const spacer = SizedBox(height: 8, width: 8);

  static final divider = Container(
    margin: const EdgeInsets.symmetric(vertical: 14),
    height: 7,
    child: Stack(
      clipBehavior: Clip.none,
      children: const [
        Positioned(
          left: -16.0,
          right: -16.0,
          child: Divider(height: 7, thickness: 7),
        ),
      ],
    ),
  );

  final double height;
  const Separator({Key? key, this.height = 8}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: height);
  }
}
