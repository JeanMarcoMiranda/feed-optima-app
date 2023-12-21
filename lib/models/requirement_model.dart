class CowRequirementsModel {
  final int id;
  final double? peso_vivo;
  final double? energia_metab;
  final double? fibra_cruda;
  final double? calcio;
  final double? fosforo;
  final double? vit_a;
  final double? vit_d;

  CowRequirementsModel(
      {required this.id,
      this.peso_vivo,
      this.energia_metab,
      this.fibra_cruda,
      this.calcio,
      this.fosforo,
      this.vit_a,
      this.vit_d});

  // Función factory para crear un objeto FoodModel a partir de un mapa
  factory CowRequirementsModel.fromJson(Map<String, dynamic> map) {
    return CowRequirementsModel(
      id: map['id'] as int,
      peso_vivo: map['peso_vivo'] as double,
      energia_metab: map['energia_metab'] as double,
      calcio: map['calcio'] as double,
      fosforo: map['fosforo'] as double,
      fibra_cruda: map['fibra_cruda'] as double,
      vit_a: map['vit_a'] as double,
      vit_d: map['vit_d'] as double,
    );
  }

// Método para convertir el objeto FoodModel a un mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'peso_vivo': peso_vivo,
      'energia_metab': energia_metab,
      'calcio': calcio,
      'fosforo': fosforo,
      'fibra_cruda': fibra_cruda,
      'vit_a': vit_a,
      'vit_d': vit_d,
    };
  }
}

class BullRequirementsModel extends CowRequirementsModel {
  final double? proteina;
  final double? ms;
  final int? numero;
  final String? raza;

  BullRequirementsModel({
    required super.id,
    super.peso_vivo,
    super.energia_metab,
    super.fibra_cruda,
    super.calcio,
    super.fosforo,
    super.vit_a,
    super.vit_d,
    this.proteina,
    this.ms,
    this.numero,
    this.raza,
  });

  // Función factory para crear un objeto FoodModel a partir de un mapa
  factory BullRequirementsModel.fromJson(Map<String, dynamic> map) {
    return BullRequirementsModel(
      id: map['id'] as int,
      peso_vivo: map['peso_vivo'] as double,
      energia_metab: map['energia_metab'] as double,
      calcio: map['calcio'] as double,
      fosforo: map['fosforo'] as double,
      fibra_cruda: map['fibra_cruda'] as double,
      vit_a: map['vit_a'] as double,
      vit_d: map['vit_d'] as double,
      proteina: map['proteina'] as double,
      ms: map['ms'] as double,
      numero: map['numero'] as int,
      raza: map['raza'] as String,
    );
  }

  // Método para convertir el objeto FoodModel a un mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'peso_vivo': peso_vivo,
      'energia_metab': energia_metab,
      'calcio': calcio,
      'fosforo': fosforo,
      'fibra_cruda': fibra_cruda,
      'vit_a': vit_a,
      'vit_d': vit_d,
      'proteina': proteina,
      'ms': ms,
      'numero': numero,
      'raza': raza
    };
  }
}
