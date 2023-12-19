import 'package:flutter/material.dart';
import 'package:foodoptima/models/requirement_state.dart';
import 'package:foodoptima/models/route_names.dart';
import 'package:foodoptima/widgets/requirements_data_table.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class RequirementsScreen extends StatelessWidget {
  final String requirementsFor;

  RequirementsScreen({super.key, required this.requirementsFor});

  final cowsColumns = [
    'Peso Vivo',
    'Energia Metab.',
    'Vit A',
    'Vit D',
    'Ca',
    'P',
    'Fibra',
  ];

  final bullsColumns = [
    'Peso Vivo',
    'Proteina',
    'Energia Metab.',
    'Vit A',
    'Vit D',
    'Ca',
    'P',
    'Fibra',
    'M.S.',
    'Nro',
    'Raza',
  ];

  List<RequerimientosVacas> requerimientosVacas = [
    RequerimientosVacas(
        pesoVivo: '200',
        eMetab: '6.02',
        vitA: '15.000',
        vitD: '6.000',
        ca: '8.00',
        p: '5.500',
        fibra: '1.80'),
    RequerimientosVacas(
        pesoVivo: '201',
        eMetab: '6.0501',
        vitA: '15.075',
        vitD: '6.030',
        ca: '8.04',
        p: '5.528',
        fibra: '1.81'),
    RequerimientosVacas(
        pesoVivo: '202',
        eMetab: '6.0802',
        vitA: '15.150',
        vitD: '6.060',
        ca: '8.08',
        p: '5.555',
        fibra: '1.82'),
    RequerimientosVacas(
        pesoVivo: '203',
        eMetab: '6.1103',
        vitA: '15.225',
        vitD: '6.090',
        ca: '8.12',
        p: '5.583',
        fibra: '1.83'),
  ];
  List<RequerimientosToros> requerimientosToros = [
    RequerimientosToros(
        pesoVivo: '203-1',
        proteina: '1.011',
        eMetab: '6.1103',
        vitA: '15.225',
        vitD: '6.090',
        ca: '8.12',
        p: '5.583',
        fibra: '1.83',
        ms: '5.60',
        n: 200,
        raza: 'Criollo'),
    RequerimientosToros(
        pesoVivo: '203-1',
        proteina: '1.011',
        eMetab: '6.1103',
        vitA: '15.225',
        vitD: '6.090',
        ca: '8.12',
        p: '5.583',
        fibra: '1.83',
        ms: '5.60',
        n: 200,
        raza: 'Criollo'),
    RequerimientosToros(
        pesoVivo: '203-1',
        proteina: '1.011',
        eMetab: '6.1103',
        vitA: '15.225',
        vitD: '6.090',
        ca: '8.12',
        p: '5.583',
        fibra: '1.83',
        ms: '5.60',
        n: 200,
        raza: 'Criollo'),
    RequerimientosToros(
        pesoVivo: '203-1',
        proteina: '1.011',
        eMetab: '6.1103',
        vitA: '15.225',
        vitD: '6.090',
        ca: '8.12',
        p: '5.583',
        fibra: '1.83',
        ms: '5.60',
        n: 200,
        raza: 'Criollo'),
  ];

  final selectedRequirements = [];

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
        title: const Text(
          'Requerimientos',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          PaginatedDataTable(
              columns: getColumns(
                  requirementsFor == 'bulls' ? bullsColumns : cowsColumns),
              rowsPerPage: 12,
              header: Text(
                  "Requerimientos en ${requirementsFor == 'bulls' ? 'Toros' : 'Vacas'}"),
              source: RequerimientosDataSource(
                  requirementsFor == 'bulls'
                      ? requerimientosToros
                      : requerimientosVacas,
                  selectedRequirements)),
        ],
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
            context.pushNamed(RouteNames.foodList);
          }
        },
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) =>
      columns.map((String column) => DataColumn(label: Text(column))).toList();
}
