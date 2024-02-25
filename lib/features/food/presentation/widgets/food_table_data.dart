import 'package:flutter/material.dart';
import 'package:foodoptima/features/food/data/models/food.dart';

class FoodDataSource extends DataTableSource {
  final List<FoodModel> _foods;
  final List<FoodModel> _selectedFoods;

  FoodDataSource(this._foods, this._selectedFoods);

  @override
  DataRow? getRow(int index) {
    if (index < _foods.length) {
      final food = _foods[index];
      // final cells = [
      //   food.name,
      //   food.dryMatter,
      //   food.totalProtein,
      //   food.netEnergyG,
      //   food.metabolizableEnergy,
      //   food.ndt,
      //   food.calcium,
      //   food.phosphorus,
      //   food.crudeFiber,
      //   food.fdn,
      //   food.vitaminA,
      //   food.vitaminD,
      //   food.unitCost
      // ];
      final cells = [
        food.name,
        food.dryMatter,
        food.totalProtein,
        food.metabolizableEnergy
      ];
      return DataRow.byIndex(
        index: index,
        selected: _selectedFoods.contains(food),
        onSelectChanged: (bool? selected) {
          if (selected != null && selected) {
            _selectedFoods.add(food);
          } else {
            _selectedFoods.remove(food);
          }
          notifyListeners();
        },
        cells: getCells(cells),
      );
    } else {
      return null;
    }
  }

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _foods.length;

  @override
  int get selectedRowCount => _selectedFoods.length;
}
