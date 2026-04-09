import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // --- VARIABEL UNTUK MENAMPUNG INPUT DARI PENGGUNA ---
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // --- STATUS UNTUK FITUR PENGINGAT LOGIN ---
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // MENGGUNAKAN WARNA LATAR PUTIH BERSIH
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 80),

              // --- JUDUL UTAMA HALAMAN OTENTIKASI ---
              const Text(
                "Sign in to Kuliku ",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),

              // --- KOMPONEN INPUT UNTUK ALAMAT EMAIL ---
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  filled: true,
                  fillColor: const Color(
                    0xFFF5F5F5,
                  ), // WARNA ABU-ABU MUDA UNTUK ESTETIKA
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(20),
                ),
              ),
              const SizedBox(height: 15),

              // --- KOMPONEN INPUT UNTUK KATA SANDI ---
              TextField(
                controller: _passwordController,
                obscureText: true, // MENYEMBUNYIKAN KARAKTER KATA SANDI
                decoration: InputDecoration(
                  hintText: "Sandi",
                  filled: true,
                  fillColor: const Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(20),
                  suffixIcon: const Icon(
                    Icons.visibility_off_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // --- BARIS UNTUK FITUR PENGINGAT DAN LUPA KATA SANDI ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                      ),
                      const Text("Ingat saya", style: TextStyle(fontSize: 13)),
                    ],
                  ),
                  const Text(
                    "Lupa Sandi?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // --- TOMBOL UTAMA UNTUK PROSES MASUK ---
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFFF05412,
                    ), // WARNA IDENTITAS ORANYE
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Masuk",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // --- KOMPONEN PEMISAH UNTUK PILIHAN LOGIN LAINNYA ---
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "atau login dengan",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 30),

              // --- TOMBOL OTENTIKASI MELALUI LAYANAN GOOGLE ---
              Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      "https://img.icons8.com/color/48/000000/google-logo.png",
                      height: 20,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Google",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              // --- NAVIGASI UNTUK PENGGUNA YANG BELUM MEMILIKI AKUN ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Belum memiliki akun?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const Text(
                    "Daftar sekarang",
                    style: TextStyle(
                      color: Color(0xFFF05412),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
