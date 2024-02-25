import 'package:flutter/material.dart';
import 'package:foodoptima/features/food/data/models/food.dart';
import 'package:foodoptima/models/food_model.dart';
import 'package:foodoptima/models/restriction_model.dart';

class FoodProvider<T> extends ChangeNotifier {
  List<T> requirementsList;
  List<FoodModel> foodList;
  List<RestrictionModel> restrictions;

  FoodProvider(
      {this.restrictions = const [],
      this.foodList = const [],
      this.requirementsList = const []});

  void changeFoodList({required List<FoodModel> newFoodList}) async {
    foodList = newFoodList;
    notifyListeners();
  }

  void changeRestrictionsList(
      {required List<FoodModel> newRestrictionList}) async {
    foodList = newRestrictionList;
    notifyListeners();
  }

  void changeRequirementsList({required List<T> newRequirementList}) async {
    requirementsList = newRequirementList;
    notifyListeners();
  }
}
