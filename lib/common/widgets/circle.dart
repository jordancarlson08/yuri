import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final Color color;
  final Widget? child;
  final double size;
  const Circle({
    Key? key,
    this.color = Colors.black,
    this.child,
    this.size = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: child,
      alignment: Alignment.center,
    );
  }
}
