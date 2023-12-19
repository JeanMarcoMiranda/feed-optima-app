import 'package:flutter/material.dart';
import 'package:foodoptima/models/food_state.dart';
import 'package:foodoptima/models/route_names.dart';
import 'package:foodoptima/widgets/food_data_search.dart';
import 'package:foodoptima/widgets/food_data_table.dart';
import 'package:go_router/go_router.dart';

class FoodListScreen extends StatefulWidget {
  const FoodListScreen({super.key});
  @override
  _TablaScreenState createState() => _TablaScreenState();
}

class _TablaScreenState extends State<FoodListScreen> {
  List<Alimento> alimentos = [
    Alimento('Aceite de soya', '10g', '1g', '0.5Mcal/kg'),
    Alimento('Alfalfa  heno,  plena flor', '20g', '2g', '0.7Mcal/kg'),
    Alimento('Alfalfa ensilada', '30g', '3g', '0.9Mcal/kg'),
    Alimento('Alfalfa fresca, plena floracion', '40g', '4g', '1.1Mcal/kg'),
    Alimento('Zanahoria', '15g', '0.5g', '0.2Mcal/kg'),
    Alimento('Manzana', '25g', '0.3g', '0.4Mcal/kg'),
    Alimento('Avena', '35g', '7g', '3Mcal/kg'),
    Alimento('Pescado', '50g', '10g', '8Mcal/kg'),
    Alimento('Pollo', '30g', '15g', '5Mcal/kg'),
    Alimento('Arroz', '40g', '3g', '2.5Mcal/kg'),
    Alimento('Huevo', '50g', '6g', '3.8Mcal/kg'),
    Alimento('Leche', '200g', '8g', '1.5Mcal/kg'),
    Alimento('Espinacas', '15g', '2g', '0.3Mcal/kg'),
    Alimento('Cebolla', '15g', '0.5g', '0.2Mcal/kg'),
    Alimento('Pimiento rojo', '20g', '1g', '0.3Mcal/kg'),
    Alimento('Garbanzos cocidos', '50g', '5g', '2.5Mcal/kg'),
    Alimento('Yogur natural', '200g', '10g', '1.2Mcal/kg'),
    Alimento('Salmón', '100g', '20g', '15Mcal/kg'),
    Alimento('Pera', '30g', '0.5g', '0.3Mcal/kg'),
    Alimento('Brócoli', '25g', '2g', '0.4Mcal/kg'),
  ];

  List<Alimento> selectedAlimentos = [];

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
                  final Alimento? result = await showSearch<Alimento>(
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
