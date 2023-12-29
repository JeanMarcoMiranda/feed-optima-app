import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:foodoptima/db/dao/food_dao.dart';
import 'package:foodoptima/models/food_model.dart';

class DataLoader {
  final foodDao = FoodDao();

  Future<void> upLoadDataOnEmpty() async {
    final isEmpty = foodDao.isEmpty("alimentos");

    if (await isEmpty) {
      DataLoader dataLoader = DataLoader();
      dataLoader.loadDataFromExcel();
    }
  }

  Future<void> loadDataFromExcel() async {
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
}
