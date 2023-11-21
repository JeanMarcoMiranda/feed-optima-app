import 'package:flutter/material.dart';

class RestrictionsScreen extends StatelessWidget {
  const RestrictionsScreen({super.key});

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
          'Restrictions screen',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Restrictions Screen'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/foodList-screen');
                },
                child: const Text('Siguiente'))
          ],
        ),
      ),
    );
  }
}
