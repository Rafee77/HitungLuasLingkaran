import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: VolumeLuasBalokApp(),
  ));
}

class VolumeLuasBalokApp extends StatefulWidget {
  @override
  _VolumeLuasBalokAppState createState() => _VolumeLuasBalokAppState();
}

class _VolumeLuasBalokAppState extends State<VolumeLuasBalokApp> {
  final TextEditingController _namaSoalController = TextEditingController();
  final TextEditingController _panjangController = TextEditingController();
  final TextEditingController _lebarController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();

  String? _namaSoal;
  double? _volume;
  double? _luasPermukaan;

  void _hitung() {
    final double panjang = double.tryParse(_panjangController.text) ?? 0;
    final double lebar = double.tryParse(_lebarController.text) ?? 0;
    final double tinggi = double.tryParse(_tinggiController.text) ?? 0;

    if (panjang > 0 && lebar > 0 && tinggi > 0) {
      setState(() {
        _namaSoal = _namaSoalController.text;
        _volume = panjang * lebar * tinggi;
        _luasPermukaan =
            2 * (panjang * lebar + panjang * tinggi + lebar * tinggi);
      });
    } else {
      setState(() {
        _volume = null;
        _luasPermukaan = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Volume dan Luas Permukaan Balok'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _namaSoalController,
              decoration: InputDecoration(
                labelText: 'Masukkan Nama Soal',
                hintText: 'Masukkan nama soal (misalnya: Case 1)',
              ),
            ),
            TextField(
              controller: _panjangController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Panjang',
                hintText: 'Masukkan nilai panjang',
              ),
            ),
            TextField(
              controller: _lebarController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Lebar',
                hintText: 'Masukkan nilai lebar',
              ),
            ),
            TextField(
              controller: _tinggiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Tinggi',
                hintText: 'Masukkan nilai tinggi',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _hitung,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Icon(
                Icons.add_box,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            if (_volume != null && _luasPermukaan != null) ...[
              Text('Nama Soal: $_namaSoal'),
              Text('Volume Balok: $_volume'),
              Text('Luas Permukaan Balok: $_luasPermukaan'),
            ] else if (_volume == null) ...[
              Text('Masukkan nilai panjang, lebar, dan tinggi dengan benar!'),
            ]
          ],
        ),
      ),
    );
  }
}
