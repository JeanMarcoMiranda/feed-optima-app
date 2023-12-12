import 'package:flutter/material.dart';
import 'package:foodoptima/models/requirement_state.dart';

class RequerimientosDataSource<T> extends DataTableSource {
  final List<T> _requerimientos;
  final List<T> _selectedRequerimientos;

  RequerimientosDataSource(this._requerimientos, this._selectedRequerimientos);
  //    : assert(T is RequerimientosToros || T is RequerimientosVacas);

  @override
  DataRow getRow(int index) {
    final requerimiento = _requerimientos[index];

    if (requerimiento is RequerimientosVacas) {
      return DataRow.byIndex(
          index: index,
          selected: _selectedRequerimientos.contains(requerimiento),
          onSelectChanged: (selected) {
            if (selected != null && selected) {
              _selectedRequerimientos.add(requerimiento);
            } else {
              _selectedRequerimientos.remove(requerimiento);
            }
            notifyListeners();
          },
          cells: [
            DataCell(Text(requerimiento.pesoVivo)),
            DataCell(Text(requerimiento.eMetab)),
            DataCell(Text(requerimiento.vitA)),
            DataCell(Text(requerimiento.vitD)),
            DataCell(Text(requerimiento.ca)),
            DataCell(Text(requerimiento.p)),
            DataCell(Text(requerimiento.fibra)),
          ]);
    } else if (requerimiento is RequerimientosToros) {
      return DataRow.byIndex(
          index: index,
          selected: _selectedRequerimientos.contains(requerimiento),
          onSelectChanged: (selected) {
            if (selected != null && selected) {
              _selectedRequerimientos.add(requerimiento);
            } else {
              _selectedRequerimientos.remove(requerimiento);
            }
            notifyListeners();
          },
          cells: [
            DataCell(Text(requerimiento.pesoVivo)),
            DataCell(Text(requerimiento.proteina)),
            DataCell(Text(requerimiento.eMetab)),
            DataCell(Text(requerimiento.vitA)),
            DataCell(Text(requerimiento.vitD)),
            DataCell(Text(requerimiento.ca)),
            DataCell(Text(requerimiento.p)),
            DataCell(Text(requerimiento.fibra)),
            DataCell(Text(requerimiento.ms)),
            DataCell(Text(requerimiento.n.toString())),
            DataCell(Text(requerimiento.raza)),
          ]);
    } else {
      throw Exception('Unexpected data type encountered');
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _requerimientos.length;

  @override
  int get selectedRowCount => _selectedRequerimientos.length;
}
