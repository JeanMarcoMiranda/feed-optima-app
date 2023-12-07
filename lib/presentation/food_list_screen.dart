import 'package:flutter/material.dart';
import 'package:foodoptima/models/foood_state.dart';

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
                Navigator.pushNamed(context, '/add_food_screen');
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: getColumns(columns),
          rows: getRows(alimentos),
        ),
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) =>
      columns.map((String column) => DataColumn(label: Text(column))).toList();

  List<DataRow> getRows(List<Alimento> alimentos) =>
      alimentos.map((Alimento alimento) {
        final cells = [
          alimento.nombre,
          alimento.materiaSeca,
          alimento.proteinasTotal,
          alimento.energiaMetabolizable
        ];
        return DataRow(
          selected: selectedAlimentos.contains(alimento),
          onSelectChanged: (bool? selected) {
            setState(() {
              if (selected!) {
                selectedAlimentos.add(alimento);
              } else {
                selectedAlimentos.remove(alimento);
              }
            });
          },
          cells: getCells(cells),
        );
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();
}
