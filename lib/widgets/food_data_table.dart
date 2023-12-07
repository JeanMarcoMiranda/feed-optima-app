import 'package:flutter/material.dart';
import 'package:foodoptima/models/food_state.dart';

class AlimentosDataSource extends DataTableSource {
  final List<Alimento> _alimentos;
  final List<Alimento> _selectedAlimentos;

  AlimentosDataSource(this._alimentos, this._selectedAlimentos);

  @override
  DataRow getRow(int index) {
    final alimento = _alimentos[index];
    return DataRow.byIndex(
      index: index,
      selected: _selectedAlimentos.contains(alimento),
      onSelectChanged: (selected) {
        if (selected != null && selected) {
          _selectedAlimentos.add(alimento);
        } else {
          _selectedAlimentos.remove(alimento);
        }
        notifyListeners();
      },
      cells: [
        DataCell(Text(alimento.nombre)),
        DataCell(Text(alimento.materiaSeca)),
        DataCell(Text(alimento.proteinasTotal)),
        DataCell(Text(alimento.energiaMetabolizable)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _alimentos.length;

  @override
  int get selectedRowCount => _selectedAlimentos.length;
}
