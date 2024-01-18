class FoodListModel {
  final int? id;
  final double precio_total;

  FoodListModel({this.id, required this.precio_total});

  factory FoodListModel.fromJson(Map<String, dynamic> map) {
    return FoodListModel(
        id: map['id'] as int, precio_total: map['precio_total'] as double);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'precio_total': precio_total};
  }
}

class FoodForFoodList {
  final int? alimentoId;
  final int? listaAlimentoId;

  FoodForFoodList({required this.alimentoId, required this.listaAlimentoId});

  factory FoodForFoodList.fromJson(Map<String, dynamic> map) {
    return FoodForFoodList(
        alimentoId: map['alimento_id'],
        listaAlimentoId: map['lista_alimento_id']);
  }
}
