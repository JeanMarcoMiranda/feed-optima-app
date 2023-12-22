class RestrictionModel {
  final int id;
  final String? alimento;
  final String? restriccion;

  RestrictionModel({required this.id, this.alimento, this.restriccion});

// Función factory para crear un objeto FoodModel a partir de un mapa
  factory RestrictionModel.fromJson(Map<String, dynamic> map) {
    return RestrictionModel(
      id: map['id'] as int,
      alimento: map['alimento'] as String,
      restriccion: map['restriccion'] as String,
    );
  }

  // Método para convertir el objeto FoodModel a un mapa
  Map<String, dynamic> toMap() {
    return {'id': id, 'alimenot': alimento, 'restriccion': restriccion};
  }
}
