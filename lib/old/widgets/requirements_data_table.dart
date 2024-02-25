import 'package:flutter/material.dart';
import 'package:foodoptima/models/requirement_model.dart';

class RequerimientosDataSource<T> extends DataTableSource {
  final List<T> _requerimientos;
  final List<T> _selectedRequerimientos;

  RequerimientosDataSource(this._requerimientos, this._selectedRequerimientos);
  //    : assert(T is RequerimientosToros || T is RequerimientosVacas);

  @override
  DataRow getRow(int index) {
    final requerimiento = _requerimientos[index];

    if (requerimiento is BullRequirementsModel) {
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
            DataCell(Text(requerimiento.peso_vivo!)),
            DataCell(Text("${requerimiento.proteina!}")),
            DataCell(Text("${requerimiento.energia_metab!}")),
            DataCell(Text("${requerimiento.vit_a!}")),
            DataCell(Text("${requerimiento.vit_d!}")),
            DataCell(Text("${requerimiento.calcio!}")),
            DataCell(Text("${requerimiento.fosforo!}")),
            DataCell(Text("${requerimiento.fibra_cruda!}")),
            DataCell(Text("${requerimiento.ms!}")),
            DataCell(Text(requerimiento.numero.toString())),
            DataCell(Text(requerimiento.raza!)),
          ]);
    } else if (requerimiento is CowRequirementsModel) {
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
            DataCell(Text(requerimiento.peso_vivo!)),
            DataCell(Text("${requerimiento.energia_metab!}")),
            DataCell(Text("${requerimiento.vit_a!}")),
            DataCell(Text("${requerimiento.vit_d!}")),
            DataCell(Text("${requerimiento.calcio!}")),
            DataCell(Text("${requerimiento.fosforo!}")),
            DataCell(Text("${requerimiento.fibra_cruda!}")),
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
