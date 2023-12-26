import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodoptima/db/dao/food_dao.dart';
import 'package:foodoptima/models/food_model.dart';
import 'package:foodoptima/application/routes/app_router.dart';
import 'package:foodoptima/providers/food_provider.dart';
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
  List<FoodModel> alimentos = [];
  List<FoodModel> selectedAlimentos = [];
  final columns = [
    'Alimentos',
    'Materia Seca',
    'Proteínas Total',
    'Energía Metab. Mcal/kg'
  ];

  @override
  void initState() {
    super.initState();
    _fetchAlimentos();
  }

  Future<void> _fetchAlimentos() async {
    final foodDao = FoodDao();
    try {
      alimentos = await foodDao.getAll();
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
                context.pushNamed(RouteNames.addFood).then((value) => setState(
                      () {
                        _fetchAlimentos();
                      },
                    ));
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: ListView(padding: const EdgeInsets.all(0.0), children: [
          PaginatedDataTable(
            columns: getColumns(columns),
            rowsPerPage: 12,
            source: AlimentosDataSource(alimentos, selectedAlimentos),
            header: const Text("Alimentos"),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () async {
                  final FoodModel? result = await showSearch<FoodModel>(
                    context: context,
                    delegate: DataSearch(alimentos),
                  );
                  if (result != null) {
                    setState(() {
                      selectedAlimentos.add(result);
                    });
                  }
                },
              ),
            ],
          ),
        ]),
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
            context.pushNamed(RouteNames.restrictions);
          }
        },
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) =>
      columns.map((String column) => DataColumn(label: Text(column))).toList();
}
