import 'package:foodoptima/application/routes/app_router.dart';
import 'package:foodoptima/features/add_food_screen.dart';
import 'package:foodoptima/features/food_list_screen.dart';
import 'package:foodoptima/features/home_screen.dart';
import 'package:foodoptima/features/previous_lists_screen.dart';
import 'package:foodoptima/features/requirements_screen.dart';
import 'package:foodoptima/features/restrictions_screen.dart';
import 'package:foodoptima/features/summary_food_list.dart';
import 'package:foodoptima/models/food_model.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
      name: RouteNames.home,
      path: "/",
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          name: RouteNames.requirements,
          path: 'requirements',
          builder: (context, state) => RequirementsScreen(
              requirementsFor: state.uri.queryParameters['for']!),
        ),
        GoRoute(
          name: RouteNames.restrictions,
          path: 'restrictions',
          builder: (context, state) => const RestrictionsScreen(),
        ),
        GoRoute(
            name: RouteNames.foodList,
            path: 'foodList',
            builder: (context, state) => const FoodListScreen(),
            routes: [
              GoRoute(
                name: RouteNames.addFood,
                path: 'addFood',
                builder: (context, state) => const AddFoodScreen(),
              ),
            ]),
        GoRoute(
          name: RouteNames.previousLists,
          path: 'previousLists',
          builder: (context, state) => const PreviousListsScreen(),
        ),
        GoRoute(
          name: RouteNames.summaryFood,
          path: 'summaryFood',
          builder: (context, state) => SummaryFoodScreen(alimentos: [
            FoodModel(name: 'Arroz', quantity: 1.0, cost: 1.2, unitCost: 1.2),
            FoodModel(
                name: 'Lentejas', quantity: 1.0, cost: 1.5, unitCost: 1.5),
            FoodModel(name: 'Papas', quantity: 1.0, cost: 0.8, unitCost: 0.8),
          ]),
        ),
      ])
]);
