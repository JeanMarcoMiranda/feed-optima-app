import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:foodoptima/config/theme/app_theme.dart';
import 'package:foodoptima/presentation/add_food_screen.dart';
import 'package:foodoptima/presentation/food_list_screen.dart';
import 'package:foodoptima/presentation/home_screen.dart';
import 'package:foodoptima/presentation/previous_lists_screen.dart';
import 'package:foodoptima/presentation/requirements_screen.dart';
import 'package:foodoptima/presentation/restrictions_screen.dart';

Future main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //overlays: [SystemUiOverlay.bottom]);

  FlutterNativeSplash.remove();

  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 20));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Optima',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme(),
      routes: {
        '/home-screen': (context) => const HomeScreen(),
        '/requirements-screen': (context) => RequirementsScreen(
              requirementsFor:
                  ModalRoute.of(context)!.settings.arguments as String,
            ),
        '/restrictions-screen': (context) => const RestrictionsScreen(),
        '/food_list_screen': (context) => const FoodListScreen(),
        '/previous_lists_screen': (context) => const PreviousListsScreen(),
        '/add_food_screen': (context) => const AddFoodScreen()
      },
      home: const HomeScreen(),
    );
  }
}
