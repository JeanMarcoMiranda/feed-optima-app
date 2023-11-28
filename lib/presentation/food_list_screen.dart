import 'package:flutter/material.dart';

class FoodListScreen extends StatelessWidget {
  const FoodListScreen({super.key});

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
          'Food List Screen',
          style: TextStyle(color: Colors.white),
        )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_food_screen');
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Food List Screen'), Text('Final de la aplicacion')],
        ),
      ),
    );
  }
}
