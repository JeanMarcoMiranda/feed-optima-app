import 'package:flutter/material.dart';
import 'package:foodoptima/models/food_state.dart';

class AlimentosDataSource extends DataTableSource {
  final List<Alimento> _alimentos;
  final List<Alimento> _selectedAlimentos;

  AlimentosDataSource(this._alimentos, this._selectedAlimentos);

  @override
  DataRow? getRow(int index) {
    if (index < _alimentos.length) {
      final alimento = _alimentos[index];
      final cells = [
        alimento.nombre,
        alimento.materiaSeca,
        alimento.proteinasTotal,
        alimento.energiaMetabolizable
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
