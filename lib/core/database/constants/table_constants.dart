class TypeData {
  static const String text = 'TEXT';
  static const String double = 'DOUBLE';
  static const String integer = 'INTEGER';
}

class Tables {
  static const String food = 'alimentos';
  static const String cowRequirements = 'requerimientosVacas';
  static const String bullRequirements = 'requerimientosToros';
  static const String restrictions = 'restricciones';
  static const String listFood = 'listaAlimentos';
  static const String foodForFoodList = 'alimentoParaListaAlimentos';
}

class FoodFields {
  static const String id = 'id';
  static const String name = 'name';
  static const String dryMatter = 'dryMatter';
  static const String totalProtein = 'totalProtein';
  static const String netEnergyG = 'netEnergyG';
  static const String metabolizableEnergy = 'metabolizableEnergy';
  static const String ndt = 'ndt';
  static const String calcium = 'calcium';
  static const String phosphorus = 'phosphorus';
  static const String crudeFiber = 'crudeFiber';
  static const String fdn = 'fdn';
  static const String vitaminA = 'vitaminA';
  static const String vitaminD = 'vitaminD';
  static const String quantity = 'quantity';
  static const String cost = 'cost';
  static const String unitCost = 'unitCost';
}

class CowFields {
  static const String id = 'id';
  static const String liveWeight = 'peso_vivo';
  static const String metabolicEnergy = 'energia_metab';
  static const String crudeFiber = 'fibra_cruda';
  static const String calcium = 'calcio';
  static const String phosphorus = 'fosforo';
  static const String vitA = 'vit_a';
  static const String vitD = 'vit_d';
}

class BullFields {
  static const String id = 'id';
  static const String liveWeight = 'peso_vivo';
  static const String metabolicEnergy = 'energia_metab';
  static const String crudeFiber = 'fibra_cruda';
  static const String calcium = 'calcio';
  static const String phosphorus = 'fosforo';
  static const String vitA = 'vit_a';
  static const String vitD = 'vit_d';
  static const String protein = 'proteina';
  static const String ms = 'ms';
  static const String number = 'numero';
  static const String breed = 'raza';
}

class RestrictionFields {
  static const String id = 'id';
  static const String food = 'alimento';
  static const String restriction = 'restriccion';
}

class ListFoodTableFields {
  static const String id = 'id';
  static const String name = 'name';
  static const String totalCost = 'totalCost';
}

class FoodListRelationshipTableFields {
  static const String id = 'id';
  static const String foodId = 'alimento_id';
  static const String foodListId = 'lista_alimentos_id';
}
