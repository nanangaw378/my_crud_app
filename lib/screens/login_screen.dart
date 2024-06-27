import 'package:flutter/material.dart';
import 'package:my_crud_app/screens/register_screen.dart';
import '../services/auth_service.dart';
import 'home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onPressed;

  LoginPage({
    required this.emailController,
    required this.passwordController,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment(1, -0.344),
            end: Alignment(-1, -0.633),
            colors: <Color>[
              Color(0xFF8C70FF),
              Color(0xBAB880FF),
              Color(0xC2100CFE),
            ],
            stops: <double>[0.121, 0.413, 1],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 11, 0, 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 37),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Belum punya akun?',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Color(0xA8FFFFFF),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0x6ED9D9D9),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: 7,
                                  horizontal: 20,
                                ),
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'Daftar',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 31),
                  Text(
                    'CRUD',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 60,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  SizedBox(height: 45),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFCFC),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 41),
                        Text(
                          'Selamat Datang',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            color: Color(0xFF000000),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Masukkan email dan password di bawah',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color(0xFF999999),
                          ),
                        ),
                        SizedBox(height: 33),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Alamat Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(height: 16),
                            TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Menangani tombol masuk
                                  // Panggil AuthService.signIn dengan email dan password yang diberikan
                                  AuthService.signIn(
                                    emailController.text,
                                    passwordController.text,
                                  ).then((success) {
                                    if (success) {
                                      // Navigasi ke HomeScreen jika login berhasil
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomeScreen(),
                                        ),
                                      );
                                    } else {
                                      // Tampilkan pesan kesalahan jika login gagal
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text('Login failed'),
                                        ),
                                      );
                                    }
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(0, 255, 1, 1),
                                  elevation: 1000,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(1, -0.02),
                                      end: Alignment(-1, -0.02),
                                      colors: <Color>[
                                        Color(0xB89D43C7),
                                        Color(0xFF001AFF),
                                        Color(0xFF001AFF),
                                      ],
                                      stops: <double>[0, 1, 1],
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  alignment: Alignment.center,
                                  constraints: BoxConstraints(
                                    maxWidth: 311,
                                    minHeight: 50,
                                  ),
                                  child: Text(
                                    'Masuk',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Color(0xFFFFE9E9),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 11),
                        Text(
                          'Lupa password kamu?',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0x9C000000),
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
