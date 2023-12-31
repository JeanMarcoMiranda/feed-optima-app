import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodoptima/db/dao/food_dao.dart';
import 'package:foodoptima/models/food_model.dart';
import 'package:foodoptima/application/routes/app_router.dart';
import 'package:foodoptima/providers/food_provider.dart';
import 'package:foodoptima/widgets/appbar_widget.dart';
import 'package:foodoptima/widgets/food_data_search.dart';
import 'package:foodoptima/widgets/food_data_table.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FoodListScreen extends StatefulWidget {
  const FoodListScreen({super.key});
  @override
  State<FoodListScreen> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  List<FoodModel> foods = [];
  List<FoodModel> selectedFoods = [];
  final columns = [
    'Alimentos',
    'Materia Seca',
    'Proteínas Total',
    'Energía Metab. Mcal/kg'
  ];

  @override
  void initState() {
    super.initState();
    _getFood();
  }

  Future<void> _getFood() async {
    final foodDao = FoodDao();
    try {
      foods = await foodDao.getAll();
      setState(() {}); // Update the UI
    } catch (error) {
      // Handle database errors
      print('Error fetching foods: $error');
      // Show an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    log("${context.watch<FoodProvider>().requirementsList}");

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: "Lista de Alimentos",
              actions: [
                IconButton(
                    onPressed: () {
                      context
                          .pushNamed(RouteNames.addFood)
                          .then((value) => setState(
                                () {
                                  _getFood();
                                },
                              ));
                    },
                    icon: const Icon(
                      Icons.add,
                    )),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    final FoodModel? result = await showSearch<FoodModel>(
                      context: context,
                      delegate: DataSearch(foods),
                    );
                    if (result != null) {
                      setState(() {
                        selectedFoods.add(result);
                      });
                    }
                  },
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: ListView(padding: const EdgeInsets.all(0.0), children: [
                  PaginatedDataTable(
                    columns: getColumns(columns),
                    rowsPerPage: 12,
                    source: FoodDataSource(foods, selectedFoods),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black45,
        selectedItemColor: Colors.black45,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.arrow_back,
              ),
              label: "Regresar"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.arrow_forward,
            ),
            label: "Siguiente",
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            context.pop();
          } else if (index == 1) {
            context
                .read<FoodProvider>()
                .changeFoodList(newFoodList: selectedFoods);
            context.pushNamed(RouteNames.restrictions);
          }
        },
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) =>
      columns.map((String column) => DataColumn(label: Text(column))).toList();
}
