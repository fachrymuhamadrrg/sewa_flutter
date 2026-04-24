import 'database.dart';
import 'package:flutter/material.dart';

import 'splash_screen.dart';

import 'database_connection.dart'
    if (dart.library.io) 'database_connection_native.dart'
    if (dart.library.js_interop) 'database_connection_web.dart';

late MyDatabase db;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  db = MyDatabase(openConnection());
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
