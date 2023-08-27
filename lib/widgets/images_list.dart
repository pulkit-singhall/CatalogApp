import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  final String imageUrl;
  const ImageList({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Image.network(imageUrl),
    );
  }
}
