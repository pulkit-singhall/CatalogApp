import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  final String imageUrl;
  const ImageList({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Image.network(imageUrl,
        alignment: Alignment.center,
        height: 200,
        width: 150,
      ),
    );
  }
}
