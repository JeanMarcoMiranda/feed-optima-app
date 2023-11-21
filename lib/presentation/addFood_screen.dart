import 'package:flutter/material.dart';

class AddFoodScren extends StatelessWidget {
  const AddFoodScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(
            child: Text(
          'Add food screen',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Add food Screen'),
          ],
        ),
      ),
    );
  }
}
