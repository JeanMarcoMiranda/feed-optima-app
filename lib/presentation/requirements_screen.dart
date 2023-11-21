import 'package:flutter/material.dart';

class RequirementsScreen extends StatelessWidget {
  const RequirementsScreen({super.key});

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
          'Requirements screen',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Requirements Screen'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/restrictions-screen');
                },
                child: const Text('Siguiente'))
          ],
        ),
      ),
    );
  }
}
