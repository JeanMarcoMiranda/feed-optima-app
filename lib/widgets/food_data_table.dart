import 'package:flutter/material.dart';
import 'package:foodoptima/models/food_model.dart';

class AlimentosDataSource extends DataTableSource {
  final List<FoodModel> _alimentos;
  final List<FoodModel> _selectedAlimentos;

  AlimentosDataSource(this._alimentos, this._selectedAlimentos);

  @override
  DataRow? getRow(int index) {
    if (index < _alimentos.length) {
      final alimento = _alimentos[index];
      final cells = [
        alimento.nombre,
        alimento.materia_seca,
        alimento.proteina_total,
        alimento.energia_metab
      ];
      return DataRow.byIndex(
        index: index,
        selected: _selectedAlimentos.contains(alimento),
        onSelectChanged: (bool? selected) {
          if (selected != null && selected) {
            _selectedAlimentos.add(alimento);
          } else {
            _selectedAlimentos.remove(alimento);
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
  int get rowCount => _alimentos.length;

  @override
  int get selectedRowCount => _selectedAlimentos.length;
}
