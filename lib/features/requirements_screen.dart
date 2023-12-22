import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodoptima/application/routes/app_router.dart';
import 'package:foodoptima/widgets/requirements_data_table.dart';
import 'package:foodoptima/models/requirement_model.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class RequirementsScreen extends StatefulWidget {
  final String requirementsFor;

  const RequirementsScreen({super.key, required this.requirementsFor});

  @override
  State<RequirementsScreen> createState() => _RequirementsScreenState();
}

class _RequirementsScreenState extends State<RequirementsScreen> {
  List<BullRequirementsModel> requerimientosToros = [];
  List<CowRequirementsModel> requerimientosVacas = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCSV();
  }

  void _loadCSV() async {
    final rawDataBulls =
        await rootBundle.loadString('assets/requerimientosToros.csv');
    final rawDataCows =
        await rootBundle.loadString('assets/requerimientosVacas.csv');

    List<List<dynamic>> listDataBulls =
        const CsvToListConverter().convert(rawDataBulls);
    List<List<dynamic>> listDataCows =
        const CsvToListConverter().convert(rawDataCows);

    List<BullRequirementsModel> listReqToros = listDataBulls
        .skip(1)
        .map((item) => BullRequirementsModel(
              peso_vivo: "${item[0]}",
              proteina:
                  double.parse("${item[1]}".replaceFirst(RegExp(','), '.')),
              energia_metab:
                  double.parse("${item[2]}".replaceFirst(RegExp(','), '.')),
              vit_a: double.parse("${item[3]}".replaceFirst(RegExp(','), '.')),
              vit_d: double.parse("${item[4]}".replaceFirst(RegExp(','), '.')),
              calcio: double.parse("${item[5]}".replaceFirst(RegExp(','), '.')),
              fosforo:
                  double.parse("${item[6]}".replaceFirst(RegExp(','), '.')),
              fibra_cruda:
                  double.parse("${item[7]}".replaceFirst(RegExp(','), '.')),
              ms: double.parse("${item[8]}".replaceFirst(RegExp(','), '.')),
              numero: int.parse("${item[9]}"),
              raza: item[10],
            ))
        .toList();

    List<CowRequirementsModel> listReqVacas = listDataCows
        .skip(2)
        .map((item) => CowRequirementsModel(
              peso_vivo: "${item[0]}",
              energia_metab:
                  double.parse("${item[1]}".replaceFirst(RegExp(','), '.')),
              vit_a: double.parse("${item[2]}".replaceFirst(RegExp(','), '.')),
              vit_d: double.parse("${item[3]}".replaceFirst(RegExp(','), '.')),
              calcio: double.parse("${item[4]}".replaceFirst(RegExp(','), '.')),
              fosforo:
                  double.parse("${item[5]}".replaceFirst(RegExp(','), '.')),
              fibra_cruda:
                  double.parse("${item[6]}".replaceFirst(RegExp(','), '.')),
            ))
        .toList();

    setState(() {
      requerimientosToros = listReqToros;
      requerimientosVacas = listReqVacas;
    });
  }

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
              columns: getColumns(widget.requirementsFor == 'bulls'
                  ? bullsColumns
                  : cowsColumns),
              rowsPerPage: 11,
              header: Text(
                  "Requerimientos en ${widget.requirementsFor == 'bulls' ? 'Toros' : 'Vacas'}"),
              source: RequerimientosDataSource(
                  widget.requirementsFor == 'bulls'
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
