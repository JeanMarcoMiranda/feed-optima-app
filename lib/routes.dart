import 'package:foodoptima/models/route_names.dart';
import 'package:foodoptima/presentation/add_food_screen.dart';
import 'package:foodoptima/presentation/food_list_screen.dart';
import 'package:foodoptima/presentation/home_screen.dart';
import 'package:foodoptima/presentation/previous_lists_screen.dart';
import 'package:foodoptima/presentation/requirements_screen.dart';
import 'package:foodoptima/presentation/restrictions_screen.dart';
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
      ])
]);
