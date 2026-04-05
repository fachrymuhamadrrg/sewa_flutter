// lib/splash_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';

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
    // Durasi dibuat sedikit lebih manusiawi agar bar-nya terlihat bergerak
    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (!mounted) return;
      setState(() {
        if (_progressValue >= 1.0) {
          timer.cancel();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        } else {
          _progressValue += 0.02; // Kecepatan loading
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
            // 1. LOGO APLIKASI
            Image.asset(
              'assets/image/amba.png',
              width: 180, // Ukuran sedikit diperkecil biar estetik
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.broken_image,
                  size: 100,
                  color: Colors.grey,
                );
              },
            ),

            const SizedBox(height: 50), // Jarak antara logo dan loading bar
            // 2. LOADING BAR (Linear)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: ClipRRect(
                // Biar ujung bar-nya bulat/smooth
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: _progressValue,
                  backgroundColor: Colors.grey[200],
                  color: const Color(
                    0xFFF3D421,
                  ), // Warna kuning khas aplikasi kak
                  minHeight: 6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
