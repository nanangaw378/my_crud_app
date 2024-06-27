import 'package:flutter/material.dart';
import 'dart:math'; // Tambahkan impor ini

class KodamScreen extends StatefulWidget {
  @override
  _KodamScreenState createState() => _KodamScreenState();
}

class _KodamScreenState extends State<KodamScreen> {
  final TextEditingController _nameController = TextEditingController();
  String? _kodamResult;
  final List<String> _kodamList = [
    'Gerry siput',
    'Ular type C',
    'Naga Mahjong',
    'Tuyul Mulet',
    'Harimau Sumbing',
    'Singa Paddle pop',
    'Mio Karbu'
  ];

  void _checkKodam() {
    final random = Random();
    setState(() {
      _kodamResult =
          "Kodam Anda: ${_kodamList[random.nextInt(_kodamList.length)]}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cek Kodam'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nama',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkKodam,
              child: const Text('Cek Kodam'),
            ),
            const SizedBox(height: 20),
            if (_kodamResult != null)
              Text(
                _kodamResult!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
