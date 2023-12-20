class FoodModel {
  final int id;
  final String nombre;
  final double? materia_seca;
  final double? proteina_total;
  final double? energia_neta_g;
  final double? energia_metab;
  final double? ndt;
  final double? calcio;
  final double? fosforo;
  final double? fibra_cruda;
  final double? fdn;
  final double? vit_a;
  final double? vit_d;

  FoodModel({
    required this.id,
    required this.nombre,
    this.materia_seca,
    this.proteina_total,
    this.energia_neta_g,
    this.energia_metab,
    this.ndt,
    this.calcio,
    this.fosforo,
    this.fibra_cruda,
    this.fdn,
    this.vit_a,
    this.vit_d,
  });

  // Función factory para crear un objeto FoodModel a partir de un mapa
  factory FoodModel.fromJson(Map<String, dynamic> map) {
    return FoodModel(
      id: map['id'] as int,
      nombre: map['nombre'] as String,
      materia_seca: map['materia_seca'] as double,
      proteina_total: map['proteina_total'] as double,
      energia_neta_g: map['energia_neta_g'] as double,
      energia_metab: map['energia_metab'] as double,
      ndt: map['ndt'] as double,
      calcio: map['calcio'] as double,
      fosforo: map['fosforo'] as double,
      fibra_cruda: map['fibra_cruda'] as double,
      fdn: map['fdn'] as double,
      vit_a: map['vit_a'] as double,
      vit_d: map['vit_d'] as double,
    );
  }

  // Método para convertir el objeto FoodModel a un mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'materia_seca': materia_seca,
      'proteina_total': proteina_total,
      'energia_neta_g': energia_neta_g,
      'energia_metab': energia_metab,
      'ndt': ndt,
      'calcio': calcio,
      'fosforo': fosforo,
      'fibra_cruda': fibra_cruda,
      'fdn': fdn,
      'vit_a': vit_a,
      'vit_d': vit_d,
    };
  }
}
