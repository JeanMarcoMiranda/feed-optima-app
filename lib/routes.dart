import 'package:foodoptima/models/route_names.dart';
import 'package:foodoptima/presentation/add_food_screen.dart';
import 'package:foodoptima/presentation/food_list_screen.dart';
import 'package:foodoptima/presentation/home_screen.dart';
import 'package:foodoptima/presentation/previous_lists_screen.dart';
import 'package:foodoptima/presentation/requirements_screen.dart';
import 'package:foodoptima/presentation/restrictions_screen.dart';
import 'package:foodoptima/presentation/summary_food_list.dart';
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
            Alimento(
                nombre: 'Arroz', cantidad: 1.0, costo: 1.2, costoUnitario: 1.2),
            Alimento(
                nombre: 'Lentejas',
                cantidad: 1.0,
                costo: 1.5,
                costoUnitario: 1.5),
            Alimento(
                nombre: 'Papas', cantidad: 1.0, costo: 0.8, costoUnitario: 0.8),
          ], cantidadTotal: 5.0),
        ),
      ])
]);
