import 'package:flutter/material.dart';
import 'package:foodoptima/application/routes/app_router.dart';
import 'package:foodoptima/db/data/loadDataFromExcel.dart';
import 'package:foodoptima/widgets/appbar_widget.dart';
import 'package:foodoptima/widgets/card_widget.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    DataLoader dataLoader = DataLoader();
    dataLoader.upLoadDataOnEmpty();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: "Food Optima",
              fontSize: 25,
              actions: [
                IconButton(
                  onPressed: () {
                    context.pushNamed(RouteNames.previousLists);
                  },
                  icon: const Icon(
                    Icons.list_alt_outlined,
                  ),
                )
              ],
            ),
            Expanded(
              child: Center(
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
            ),
          ],
        ),
      ),
    );
  }
}
