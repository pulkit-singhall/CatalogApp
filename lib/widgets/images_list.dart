import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  final String imageUrl;
  const ImageList({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 350,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(240, 241, 234, 1.0),
          borderRadius: BorderRadius.circular(30)
        ),
        child: Image.network(imageUrl,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
