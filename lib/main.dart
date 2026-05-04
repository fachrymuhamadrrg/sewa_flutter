import 'package:sewa_flutter/database/database.dart';
import 'package:flutter/material.dart';

import 'package:sewa_flutter/pages/splash_screen.dart';

import 'package:sewa_flutter/database/database_connection.dart'
    if (dart.library.io) 'package:sewa_flutter/database/database_connection_native.dart'
    if (dart.library.js_interop) 'package:sewa_flutter/database/database_connection_web.dart';

late MyDatabase db;

// VARIABEL GLOBAL UNTUK PENYIMPANAN SEMENTARA DI WEB
ValueNotifier<List<Alat>> globalHistory = ValueNotifier([]);
int globalNextId = 1;
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
