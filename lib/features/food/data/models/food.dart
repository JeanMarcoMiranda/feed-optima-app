import 'package:foodoptima/core/database/constants/table_constants.dart';
import 'package:foodoptima/core/resources/dao_state.dart';
import 'package:foodoptima/features/food/domain/entities/food.dart';

class FoodModel extends FoodEntity implements Dao<FoodModel> {
  const FoodModel({
    int? id,
    String? name,
    double? dryMatter,
    double? totalProtein,
    double? netEnergyG,
    double? metabolizableEnergy,
    double? ndt,
    double? calcium,
    double? phosphorus,
    double? crudeFiber,
    double? fdn,
    double? vitaminA,
    double? vitaminD,
    double? quantity,
    double? cost,
    double? unitCost,
  });

  @override
  List<FoodModel> fromList(List<Map<String, dynamic>> list) {
    List<FoodModel> foods = List<FoodModel>.empty();
    for (Map<String, dynamic> map in list) {
      foods.add(fromMap(map));
    }
    return foods;
  }

  @override
  FoodModel fromMap(Map<String, dynamic> map) {
    return FoodModel(
      id: map[FoodFields.id] as int,
      name: map[FoodFields.name] as String,
      dryMatter: map[FoodFields.dryMatter] as double,
      totalProtein: map[FoodFields.totalProtein] as double,
      netEnergyG: map[FoodFields.netEnergyG] as double,
      metabolizableEnergy: map[FoodFields.metabolizableEnergy] as double,
      ndt: map[FoodFields.ndt] as double,
      calcium: map[FoodFields.calcium] as double,
      phosphorus: map[FoodFields.phosphorus] as double,
      crudeFiber: map[FoodFields.crudeFiber] as double,
      fdn: map[FoodFields.fdn] as double,
      vitaminA: map[FoodFields.vitaminA] as double,
      vitaminD: map[FoodFields.vitaminD] as double,
      quantity: map[FoodFields.quantity] as double,
      cost: map[FoodFields.cost] as double,
      unitCost: map[FoodFields.unitCost] as double,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      FoodFields.id: id,
      FoodFields.name: name,
      FoodFields.dryMatter: dryMatter,
      FoodFields.totalProtein: totalProtein,
      FoodFields.netEnergyG: netEnergyG,
      FoodFields.metabolizableEnergy: metabolizableEnergy,
      FoodFields.ndt: ndt,
      FoodFields.calcium: calcium,
      FoodFields.phosphorus: phosphorus,
      FoodFields.crudeFiber: crudeFiber,
      FoodFields.fdn: fdn,
      FoodFields.vitaminA: vitaminA,
      FoodFields.vitaminD: vitaminD,
      FoodFields.quantity: quantity,
      FoodFields.cost: cost,
      FoodFields.unitCost: unitCost,
    };
  }
}
