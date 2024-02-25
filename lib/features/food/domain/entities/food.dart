import 'package:equatable/equatable.dart';

class FoodEntity extends Equatable {
  final int? id;
  final String? name;
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
  final double? quantity; //final?
  final double? cost; //final?
  final double? unitCost; //final?

  const FoodEntity({
    this.id,
    this.name,
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

  @override
  List<Object?> get props {
    return [
      id,
      name,
      dryMatter,
      totalProtein,
      netEnergyG,
      metabolizableEnergy,
      ndt,
      calcium,
      phosphorus,
      crudeFiber,
      fdn,
      vitaminA,
      vitaminD,
      quantity,
      cost,
      unitCost,
    ];
  }

  @override
  bool get stringify => true;
}
