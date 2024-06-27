import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
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
          ),
          Column(
            children: [
              AppBar(
                title: const Text('Home'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () async {
                      await AuthService.signOut();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                  ),
                ],
                backgroundColor: Colors.transparent,
                elevation: 0, // Menghapus bayangan pada AppBar
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/crud');
                        },
                        child: const Text('Go to CRUD'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/kodam');
                        },
                        child: const Text('Cek Kodam'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
