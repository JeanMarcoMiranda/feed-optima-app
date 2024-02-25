import 'package:foodoptima/db/dao/food_dao.dart';
import 'package:foodoptima/db/database_helper.dart';
import 'package:foodoptima/models/food_list_model.dart';
import 'package:foodoptima/models/food_model.dart';
import 'package:sqflite/sqflite.dart';

class FoodListWithFoods {
  final FoodListModel foodList;
  final List<FoodModel> foods;

  FoodListWithFoods({required this.foodList, required this.foods});
}

class FoodListDao {
  final dbHelper = DatabaseHelper.instance.database;
  final foodDao = FoodDao();

  // Insert new foodList
  Future<int> insert(FoodListModel data) async {
    Database db = await dbHelper;
    final listId = await db.insert('listaAlimentos', data.toMap());
    return listId;
  }

  // Add foods to foodList
  Future<int> insertListFoodWithFoods(
      FoodListModel list, List<FoodModel> foods) async {
    final db = await dbHelper;
    final listId = await insert(list);

    for (final food in foods) {
      db.insert("alimentoParaListaAlimentos",
          {'alimento_id': food.id, 'lista_alimentos_id': listId});
    }

    return listId;
  }

  Future<List<FoodListModel>> getAll() async {
    Database db = await dbHelper;
    List<Map<String, dynamic>> data = await db.query('listaAlimentos');
    return data.map((e) => FoodListModel.fromJson(e)).toList();
  }

  Future<List<FoodForFoodList>> getFoodsRelatedToList(int id) async {
    Database db = await dbHelper;

    List<Map<String, dynamic>> data = await db
        .query('alimentosParaListaAlimentos', where: 'id = ?', whereArgs: [id]);

    return data.map((e) => FoodForFoodList.fromJson(e)).toList();
  }

  Future<List<FoodModel>> getFoodsForListOfFoods(int id) async {
    final foodsRelatedToListOfFoods = await getFoodsRelatedToList(id);
    final foodsFromFoodList = await Future.wait(foodsRelatedToListOfFoods
        .map((e) async =>
            e.alimentoId != null ? await foodDao.getById(e.alimentoId!) : null)
        .toList());

    return foodsFromFoodList.whereType<FoodModel>().toList();
  }

  Future<List<FoodListWithFoods>> getFoodListWithFoods() async {
    final foodLists = await getAll();
    final foodListWithFoods = await Future.wait(foodLists
        .map((list) async => FoodListWithFoods(
            foodList: list, foods: await getFoodsForListOfFoods(list.id!)))
        .toList());

    return foodListWithFoods;
  }
}
