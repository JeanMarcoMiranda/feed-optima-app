import 'package:flutter/material.dart';
import 'package:foodoptima/models/route_names.dart';
import 'package:go_router/go_router.dart';

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
                  context.goNamed(RouteNames.summaryFood);
                },
                child: const Text('Siguiente'))
          ],
        ),
      ),
    );
  }
}
