import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String cardText;
  final String imgURL;

  const CardWidget({super.key, required this.cardText, required this.imgURL});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            // borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              imgURL,
              height: 0.25 * screenHeight,
              width: 0.85 * screenWidth,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(cardText),
          ),
        ],
      ),
    );
  }
}
