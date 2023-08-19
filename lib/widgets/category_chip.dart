import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  // parameters
  final String filter;
  final int startIndex;
  final int index;
  const CategoryChip(
      {super.key,
      required this.filter,
      required this.startIndex,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(filter),
      labelStyle: const TextStyle(
          fontFamily: "Lato",
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 16),
      backgroundColor: startIndex == index
          ? const Color.fromRGBO(244, 217, 4, 1.0)
          : const Color.fromRGBO(243, 243, 248, 1.0),
      labelPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }
}
