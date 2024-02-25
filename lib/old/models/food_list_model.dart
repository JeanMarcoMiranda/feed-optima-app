class FoodListModel {
  final int? id;
  final String name;
  final double totalCost;

  FoodListModel({this.id, required this.name, required this.totalCost});

  factory FoodListModel.fromJson(Map<String, dynamic> map) {
    return FoodListModel(
        id: map['id'] as int,
        name: map['name'] as String,
        totalCost: map['totalCost'] as double);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'totalCost': totalCost};
  }
}

class FoodForFoodList {
  final int? alimentoId;
  final int? listaAlimentoId;

  FoodForFoodList({
    required this.alimentoId,
    required this.listaAlimentoId,
  });

  factory FoodForFoodList.fromJson(Map<String, dynamic> map) {
    return FoodForFoodList(
        alimentoId: map['alimento_id'],
        listaAlimentoId: map['lista_alimento_id']);
  }
}
