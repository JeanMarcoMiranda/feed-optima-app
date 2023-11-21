import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodoptima/config/theme/app_theme.dart';
import 'package:foodoptima/presentation/addFood_screen.dart';
import 'package:foodoptima/presentation/foodList_screen.dart';
import 'package:foodoptima/presentation/home_screen.dart';
import 'package:foodoptima/presentation/previousLists-screen.dart';
import 'package:foodoptima/presentation/requirements_screen.dart';
import 'package:foodoptima/presentation/restrictions_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Optima',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme(),
      home: const HomeScreen(),
      routes: {
        '/home-screen': (context) => const HomeScreen(),
        '/requirements-screen': (context) => const RequirementsScreen(),
        '/restrictions-screen': (context) => const RestrictionsScreen(),
        '/foodList-screen': (context) => const FoodListScreen(),
        '/previousLists-screen': (context) => const PreviousListsScreen(),
        '/addFood-scren': (context) => const AddFoodScren()
      },
    );
  }
}
