import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; 
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/crud_screen.dart';
import 'screens/kodam.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter CRUD App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => LoginPage(
              emailController: TextEditingController(),
              passwordController: TextEditingController(),
              onPressed: () {}, // Implementasikan fungsi onPressed yang sesuai
            ),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/crud': (context) => const CRUDScreen(),
        '/kodam': (context) => KodamScreen(),
      },
    );
  }
}
