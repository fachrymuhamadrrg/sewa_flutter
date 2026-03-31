import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'history_page.dart';
import 'profile_page.dart';

List<Map<String, String>> favoriteItems = []; //item favorit

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Tool',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF212121),
          foregroundColor: Color(0xFFF3D421),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
