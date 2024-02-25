import 'package:flutter/material.dart';
import 'package:foodoptima/config/routes/app_routes.dart';
import 'package:foodoptima/core/ui/widgets/app_bar_implementation.dart';
import 'package:foodoptima/old/db/data/loadDataFromExcel.dart';

import 'package:go_router/go_router.dart';

import '../widgets/animal_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    DataLoader loader = DataLoader();
    loader.upLoadDataOnEmpty();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarImpl(
              title: "Food Optima",
              fontSize: 25,
              actions: [
                IconButton(
                  onPressed: () {
                    context.pushNamed(AppRoutes.previousLists);
                  },
                  icon: const Icon(Icons.list_alt_outlined),
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
                        context.pushNamed(AppRoutes.requirements,
                            queryParameters: {'for': 'bulls'});
                      },
                      child: const CardWidget(
                        cardText: "Toro",
                        img: "assets/toro.png",
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(AppRoutes.requirements,
                            queryParameters: {'for': 'cows'});
                      },
                      child: const CardWidget(
                        cardText: "Vaca",
                        img: "assets/vaca.png",
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
