import 'package:foodoptima/features/animal/presentation/views/animal_selection.dart';

import 'app_routes.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
      name: AppRoutes.home,
      path: "/",
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          name: AppRoutes.requirements,
          path: 'requirements',
          builder: (context, state) => RequirementsScreen(
              requirementsFor: state.uri.queryParameters['for']!),
        ),
        GoRoute(
          name: AppRoutes.restrictions,
          path: 'restrictions',
          builder: (context, state) => const RestrictionsScreen(),
        ),
        GoRoute(
            name: AppRoutes.foodList,
            path: 'foodList',
            builder: (context, state) => const FoodListScreen(),
            routes: [
              GoRoute(
                name: AppRoutes.addFood,
                path: 'addFood',
                builder: (context, state) => const AddFoodScreen(),
              ),
            ]),
        GoRoute(
          name: AppRoutes.previousLists,
          path: 'previousLists',
          builder: (context, state) => const PreviousListsScreen(),
        ),
        GoRoute(
          name: AppRoutes.summaryFood,
          path: 'summaryFood',
          builder: (context, state) => const SummaryFoodScreen(),
        ),
      ])
]);
