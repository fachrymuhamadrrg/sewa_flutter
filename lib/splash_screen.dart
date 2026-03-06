// lib/splash_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart'; // <--- Pastikan import login_page

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (!mounted) return;
      setState(() {
        if (_progressValue >= 1.0) {
          timer.cancel();
          // PINDAH KE LOGIN DULU, KAK!
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        } else {
          _progressValue += 0.02;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gunakan try-catch atau placeholder jika asset belum siap
            Image.asset(
              'assets/image/logo.png', // Sesuaikan nama file ya kak
              width: 200,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.broken_image, size: 100, color: Colors.red);
              },
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(color: Color(0xFFF3D421)),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: LinearProgressIndicator(
                value: _progressValue,
                backgroundColor: Colors.grey[200],
                color: const Color(0xFFF3D421),
                minHeight: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}