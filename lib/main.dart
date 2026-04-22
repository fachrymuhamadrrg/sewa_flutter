import 'dart:io';
import 'database.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'splash_screen.dart';

late MyDatabase db;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  db = MyDatabase(_openConnection());
  runApp(const MyApp());
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
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
