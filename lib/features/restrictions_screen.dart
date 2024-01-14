import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodoptima/models/restriction_model.dart';
import 'package:foodoptima/application/routes/app_router.dart';
import 'package:foodoptima/widgets/appbar_widget.dart';
import 'package:go_router/go_router.dart';

class RestrictionsScreen extends StatefulWidget {
  const RestrictionsScreen({super.key});

  @override
  State<RestrictionsScreen> createState() => _RestrictionsScreenState();
}

class _RestrictionsScreenState extends State<RestrictionsScreen> {
  List<RestrictionState> restrictions = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCSV();
  }

  void _loadCSV() async {
    final rawRestrictionData =
        await rootBundle.loadString('assets/restricciones.csv');

    List<List<dynamic>> listDataRestrictions =
        const CsvToListConverter().convert(rawRestrictionData);

    List<RestrictionState> restrictionsList = listDataRestrictions
        .skip(2)
        .map(
            (item) => RestrictionState(alimento: item[0], restriccion: item[1]))
        .toList();

    setState(() {
      restrictions = restrictionsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: "Lista de Restricciones",
              fontSize: 25,
            ),
            Expanded(
              child: ListView(
                children: [...restrictions.map(restrictionsListItem)],
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
            context.pushNamed(RouteNames.summaryFood);
          }
        },
      ),
    );
  }

  Widget restrictionsListItem(RestrictionState state) => CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          state.alimento!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(state.restriccion!),
        value: state.isSelected,
        onChanged: (value) {
          setState(() => state.isSelected = value!);
        },
      );
}
