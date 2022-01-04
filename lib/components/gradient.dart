import 'package:flutter/material.dart';

class GradientBox extends StatelessWidget {
  final Widget child;

  const GradientBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(66, 135, 245, 1),
            Color.fromRGBO(43, 156, 255, 1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
      ),
      child: child,
    );
  }
}
