import '../constants/table_constants.dart';
import '../utils/create_table.dart';

String createFoodTable() {
  return CreateTable(
    tableName: Tables.food,
    primaryKey: FoodFields.id,
    fields: {
      FoodFields.name: TypeData.text,
      FoodFields.dryMatter: TypeData.double,
      FoodFields.totalProtein: TypeData.double,
      FoodFields.netEnergyG: TypeData.double,
      FoodFields.metabolizableEnergy: TypeData.double,
      FoodFields.ndt: TypeData.double,
      FoodFields.calcium: TypeData.double,
      FoodFields.phosphorus: TypeData.double,
      FoodFields.crudeFiber: TypeData.double,
      FoodFields.fdn: TypeData.double,
      FoodFields.vitaminA: TypeData.double,
      FoodFields.vitaminD: TypeData.double,
      FoodFields.quantity: TypeData.double,
      FoodFields.cost: TypeData.double,
      FoodFields.unitCost: TypeData.double,
    },
  ).create();
}
// 'dryMatter': 'DOUBLE',
// 'totalProtein': 'DOUBLE',
// 'netEnergyG': 'DOUBLE',
// 'metabolizableEnergy': 'DOUBLE',
// 'ndt': 'DOUBLE',
// 'calcium': 'DOUBLE',
// 'phosphorus': 'DOUBLE',
// 'crudeFiber': 'DOUBLE',
// 'fdn': 'DOUBLE',
// 'vitaminA': 'DOUBLE',
// 'vitaminD': 'DOUBLE',
// 'quantity': 'DOUBLE',
// 'cost': 'DOUBLE',
// 'unitCost': 'DOUBLE',

String createCowRequirementsTable() {
  return CreateTable(
    tableName: Tables.cowRequirements,
    primaryKey: CowFields.id,
    fields: {
      CowFields.liveWeight: TypeData.text,
      CowFields.metabolicEnergy: TypeData.double,
      CowFields.crudeFiber: TypeData.double,
      CowFields.calcium: TypeData.double,
      CowFields.phosphorus: TypeData.double,
      CowFields.vitA: TypeData.double,
      CowFields.vitD: TypeData.double
    },
  ).create();
}

String createBullRequirementsTable() {
  return CreateTable(
    tableName: Tables.bullRequirements,
    primaryKey: BullFields.id,
    fields: {
      BullFields.liveWeight: TypeData.text,
      BullFields.metabolicEnergy: TypeData.double,
      BullFields.crudeFiber: TypeData.double,
      BullFields.calcium: TypeData.double,
      BullFields.phosphorus: TypeData.double,
      BullFields.vitA: TypeData.double,
      BullFields.vitD: TypeData.double,
      BullFields.protein: TypeData.double,
      BullFields.ms: TypeData.double,
      BullFields.number: TypeData.double,
      BullFields.breed: TypeData.text
    },
  ).create();
}

String createRestrictionsTable() {
  return CreateTable(
    tableName: Tables.restrictions,
    primaryKey: RestrictionFields.id,
    fields: {
      RestrictionFields.food: TypeData.text,
      RestrictionFields.restriction: TypeData.text,
    },
  ).create();
}

String createListFoodTable() {
  return CreateTable(
    tableName: Tables.listFood,
    primaryKey: ListFoodTableFields.id,
    fields: {
      ListFoodTableFields.name: TypeData.text,
      ListFoodTableFields.totalCost: TypeData.double,
    },
  ).create();
}

String createFoodForFoodListTable() {
  return CreateTable(
    tableName: Tables.foodForFoodList,
    primaryKey: FoodListRelationshipTableFields.id,
    fields: {
      FoodListRelationshipTableFields.foodId: '${TypeData.integer} NOT NULL',
      FoodListRelationshipTableFields.foodListId:
          '${TypeData.integer} NOT NULL',
    },
    foreignKeys: {
      FoodListRelationshipTableFields.foodId:
          '${Tables.food}(${FoodFields.id})',
      FoodListRelationshipTableFields.foodListId:
          '${Tables.listFood}(${ListFoodTableFields.id})',
    },
  ).create();
}
