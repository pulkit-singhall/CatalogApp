import 'package:flutter/material.dart';

class DrawerText extends StatelessWidget {
  final String image;
  final String heading;

  const DrawerText({super.key, required this.heading, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: AssetImage(image),
          height: 30,
          width: 30,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          heading.toString(),
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'lato',
          ),
        ),
      ],
    );
  }
}
