import 'package:flutter/material.dart';
import 'package:foodoptima/application/routes/app_router.dart';
import 'package:foodoptima/widgets/card_widget.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Food Optima',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        leading: Container(),
        actions: [
          IconButton(
              onPressed: () {
                context.pushNamed(RouteNames.previousLists);
              },
              icon: const Icon(
                Icons.list_alt_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                context.pushNamed(RouteNames.requirements,
                    queryParameters: {'for': 'bulls'});
              },
              child: const CardWidget(
                cardText: "Toro",
                imgURL:
                    "https://lasventastour.com/wp-content/uploads/2020/01/Toro-Bravo-Las-Ventas-Tour-2.png",
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                context.pushNamed(RouteNames.requirements,
                    queryParameters: {'for': 'cows'});
              },
              child: const CardWidget(
                cardText: "Vaca",
                imgURL:
                    "https://taxonomiaanimal.files.wordpress.com/2018/03/vaca.png",
              ),
            )
          ],
        ),
      ),
    );
  }
}