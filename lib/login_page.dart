import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("SELAMAT DATANG", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            const TextField(decoration: InputDecoration(labelText: "Email/Username", border: OutlineInputBorder())),
            const SizedBox(height: 15),
            const TextField(obscureText: true, decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder())),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF3D421), foregroundColor: Colors.black),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: 'E-Tool')));
                },
                child: const Text("MASUK"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}