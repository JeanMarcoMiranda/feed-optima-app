import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodoptima/config/theme/app_theme.dart';
import 'package:foodoptima/presentation/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Food Optima',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().theme(),
        home: const HomeScreen());
  }
}
