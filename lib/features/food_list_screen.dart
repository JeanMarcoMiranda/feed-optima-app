import 'package:flutter/material.dart';
import 'package:foodoptima/models/food_model.dart';
import 'package:foodoptima/application/routes/app_router.dart';
import 'package:foodoptima/widgets/food_data_search.dart';
import 'package:foodoptima/widgets/food_data_table.dart';
import 'package:go_router/go_router.dart';

class FoodListScreen extends StatefulWidget {
  const FoodListScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _TablaScreenState createState() => _TablaScreenState();
}

class _TablaScreenState extends State<FoodListScreen> {
  List<FoodModel> alimentos = [
    // FoodModel('Aceite de soya', 10, 1, 0.5),
  ];

  List<FoodModel> selectedAlimentos = [];

  final columns = [
    'Alimentos',
    'Materia Seca',
    'Proteínas Total',
    'Energía Metab. Mcal/kg'
  ];

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
                context.goNamed(RouteNames.addFood);
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
        ]
            // child: DataTable(
            //   columns: getColumns(columns),
            //   rows: getRows(alimentos),
            // ),
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
            context.pushNamed(RouteNames.restrictions);
          }
        },
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) =>
      columns.map((String column) => DataColumn(label: Text(column))).toList();
}
