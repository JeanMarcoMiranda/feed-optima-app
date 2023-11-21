import 'package:flutter/material.dart';
import 'package:foodoptima/widgets/card_widget.dart';

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
        )),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        toolbarHeight: 70,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.list,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardWidget(
              cardText: "Toro",
              imgURL:
                  "https://lasventastour.com/wp-content/uploads/2020/01/Toro-Bravo-Las-Ventas-Tour-2.png",
            ),
            SizedBox(height: 30),
            CardWidget(
              cardText: "Vaca",
              imgURL:
                  "https://taxonomiaanimal.files.wordpress.com/2018/03/vaca.png",
            ),
          ],
        ),
      ),
    );
  }
}
