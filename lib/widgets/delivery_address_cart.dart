import 'package:flutter/material.dart';

class DeliveryAddressCart extends StatelessWidget {
  final String name;
  final String address;

  const DeliveryAddressCart(
      {super.key, required this.name, required this.address});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: const Border(
            left: BorderSide(
              color: Colors.black,
              width: 0.3,
              style: BorderStyle.solid,
            ),
            right: BorderSide(
              color: Colors.black,
              width: 0.3,
              style: BorderStyle.solid,
            ),
            bottom: BorderSide(
              color: Colors.black,
              width: 0.3,
              style: BorderStyle.solid,
            ),
            top: BorderSide(
              color: Colors.black,
              width: 0.3,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Deliver To : ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 18),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  name.toString(),
                  maxLines: 1,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Address : ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 18),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    address.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
