import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:foodoptima/core/database/constants/table_constants.dart';
import 'package:foodoptima/core/database/migrations/init_database.dart';
import 'package:foodoptima/features/food/data/models/food.dart';
import 'data_repository.dart';

class LoadDataRepository implements DataRepository {
  final DatabaseHelper _databaseHelper;

  LoadDataRepository(this._databaseHelper);
  @override
  Future<void> uploadDataIfEmpty() async {
    try {
      if (await _databaseHelper.isEmpty(Tables.food)) {
        await _loadDataFromExcel();
      }

      if (await _databaseHelper.isEmpty(Tables.cowRequirements)) {
        await _loadCowRequirementsFromCSV();
      }

      if (await _databaseHelper.isEmpty(Tables.bullRequirements)) {
        await _loadBullRequirementsFromCSV();
      }
    } catch (error) {
      // Manejar errores aquí
      print('Error during data upload: $error');
      rethrow; //lanzar una excepción personalizada según sea necesario
    }
  }

  Future<void> _loadDataFromExcel() async {
    final rawDataFoods = await rootBundle.loadString('assets/alimentos.csv');

    List<List<dynamic>> listDataFoods =
        const CsvToListConverter().convert(rawDataFoods);

    List<FoodModel> listFood = listDataFoods
        .map((item) => FoodModel(
              name: "${item[0]}",
              dryMatter: double.parse("${item[1]}"),
              totalProtein: double.parse("${item[2]}"),
              netEnergyG: double.parse("${item[3]}"),
              metabolizableEnergy: double.parse("${item[4]}"),
              ndt: double.parse("${item[5]}"),
              calcium: double.parse("${item[6]}"),
              phosphorus: double.parse("${item[7]}"),
              crudeFiber: double.parse("${item[8]}"),
              fdn: double.parse("${item[9]}"),
              vitaminA: double.parse("${item[10]}"),
              vitaminD: double.parse("${item[11]}"),
              quantity: 0,
              cost: 0,
              unitCost: 0,
            ))
        .toList();

    // Inserta los alimentos en la base de datos
    for (FoodModel food in listFood) {
      foodDao.insert(food);
    }
  }

  Future<void> _loadCowRequirementsFromCSV() async {
    final rawDataCows =
        await rootBundle.loadString('assets/requerimientosVacas.csv');

    List<List<dynamic>> listDataCows =
        const CsvToListConverter().convert(rawDataCows);

    List<CowRequirementsModel> listCows = listDataCows
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
    // Inserta las vacas en la base de datos
    for (CowRequirementsModel cow in listCows) {
      cowReqDao.insert(cow);
    }
  }

  Future<void> _loadBullRequirementsFromCSV() async {
    final rawDataBulls =
        await rootBundle.loadString('assets/requerimientosToros.csv');

    List<List<dynamic>> listDataBulls =
        const CsvToListConverter().convert(rawDataBulls);

    List<BullRequirementsModel> listBulls = listDataBulls
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
    // Inserta los toros en la base de datos
    for (BullRequirementsModel bull in listBulls) {
      bullReqDao.insert(bull);
    }
  }
}
