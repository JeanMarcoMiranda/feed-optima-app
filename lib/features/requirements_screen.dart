import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodoptima/application/routes/app_router.dart';
import 'package:foodoptima/db/dao/requirement_dao.dart';
import 'package:foodoptima/providers/food_provider.dart';
import 'package:foodoptima/widgets/appbar_widget.dart';
import 'package:foodoptima/widgets/requirements_data_search.dart';
import 'package:foodoptima/widgets/requirements_data_table.dart';
import 'package:foodoptima/models/requirement_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
    if (widget.requirementsFor == 'bulls') {
      _fetchBullRequirements();
    } else {
      _fetchCowRequirements();
    }
  }

  Future<void> _fetchCowRequirements() async {
    final cowReqDao = CowRequirementsDao();
    try {
      final fetchedData = await cowReqDao.getAll();
      log("$fetchedData");
      requerimientosVacas = fetchedData;
      setState(() {});
    } catch (error) {
      log('Error fetching cow requirements: $error');
    }
  }

  Future<void> _fetchBullRequirements() async {
    final bullReqDao = BullRequirementsDao();
    try {
      requerimientosToros = await bullReqDao.getAll();
      setState(() {});
    } catch (error) {
      log('Error fetching cow requirements: $error');
    }
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
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title:
                  "Requerimientos en ${widget.requirementsFor == 'bulls' ? 'Toros' : 'Vacas'}",
              actions: [
                IconButton(
                    onPressed: () async {
                      if (widget.requirementsFor == 'bulls') {
                        final BullRequirementsModel? resultBulls =
                            await showSearch(
                                context: context,
                                delegate: RequirementsDataSearch(
                                    requerimientosToros));

                        if (resultBulls != null) {
                          setState(() {
                            selectedRequirements.add(resultBulls);
                          });
                        }
                      } else if (widget.requirementsFor == 'cows') {
                        final CowRequirementsModel? resultCows =
                            await showSearch(
                                context: context,
                                delegate: RequirementsDataSearch(
                                    requerimientosVacas));

                        if (resultCows != null) {
                          setState(() {
                            selectedRequirements.add(resultCows);
                          });
                        }
                      }
                    },
                    icon: const Icon(Icons.search))
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  PaginatedDataTable(
                    columns: getColumns(widget.requirementsFor == 'bulls'
                        ? bullsColumns
                        : cowsColumns),
                    rowsPerPage: 13,
                    source: RequerimientosDataSource(
                        widget.requirementsFor == 'bulls'
                            ? requerimientosToros
                            : requerimientosVacas,
                        selectedRequirements),
                  ),
                ],
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
            context.read<FoodProvider>().changeRequirementsList(
                newRequirementList: selectedRequirements);
            context.pushNamed(RouteNames.foodList);
          }
        },
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) =>
      columns.map((String column) => DataColumn(label: Text(column))).toList();
}
