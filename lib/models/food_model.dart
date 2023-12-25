class FoodModel {
  final int? id;
  final String name;
  final double? dryMatter;
  final double? totalProtein;
  final double? netEnergyG;
  final double? metabolizableEnergy;
  final double? ndt;
  final double? calcium;
  final double? phosphorus;
  final double? crudeFiber;
  final double? fdn;
  final double? vitaminA;
  final double? vitaminD;
  double? quantity;
  double? cost;
  double? unitCost;

  FoodModel({
    this.id,
    required this.name,
    this.dryMatter,
    this.totalProtein,
    this.netEnergyG,
    this.metabolizableEnergy,
    this.ndt,
    this.calcium,
    this.phosphorus,
    this.crudeFiber,
    this.fdn,
    this.vitaminA,
    this.vitaminD,
    this.quantity,
    this.cost,
    this.unitCost,
  });

  // Función factory para crear un objeto FoodModel a partir de un mapa
  factory FoodModel.fromJson(Map<String, dynamic> map) {
    return FoodModel(
      id: map['id'] as int,
      name: map['name'] as String,
      dryMatter: map['dryMatter'] as double,
      totalProtein: map['totalProtein'] as double,
      netEnergyG: map['netEnergyG'] as double,
      metabolizableEnergy: map['metabolizableEnergy'] as double,
      ndt: map['ndt'] as double,
      calcium: map['calcium'] as double,
      phosphorus: map['phosphorus'] as double,
      crudeFiber: map['crudeFiber'] as double,
      fdn: map['fdn'] as double,
      vitaminA: map['vitaminA'] as double,
      vitaminD: map['vitaminD'] as double,
      quantity: map['quantity'] as double,
      cost: map['cost'] as double,
      unitCost: map['unitCost'] as double,
    );
  }

  // Método para convertir el objeto FoodModel a un mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'dryMatter': dryMatter,
      'totalProtein': totalProtein,
      'netEnergyG': netEnergyG,
      'metabolizableEnergy': metabolizableEnergy,
      'ndt': ndt,
      'calcium': calcium,
      'phosphorus': phosphorus,
      'crudeFiber': crudeFiber,
      'fdn': fdn,
      'vitaminA': vitaminA,
      'vitaminD': vitaminD,
      'quantity': quantity,
      'cost': cost,
      'unitCost': unitCost,
    };
  }
}
