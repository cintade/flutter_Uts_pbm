import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> kegiatan = [
    {'nama': 'Rapat Karate', 'tanggal': 'Senin, 6 Mei', 'selesai': false},
    {'nama': 'Praktikum PBM', 'tanggal': 'Selasa, 7 Mei', 'selesai': false},
    {'nama': 'Nugas MP', 'tanggal': 'Selasa, 8 Mei', 'selesai': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[900]
              : Colors.teal[50], // warna latar
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: kegiatan.length,
        itemBuilder: (context, index) {
          return Card(
            color:
                kegiatan[index]['selesai'] ? Colors.green[100] : Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: CheckboxListTile(
              activeColor: Colors.teal,
              title: Text(
                kegiatan[index]['nama'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration:
                      kegiatan[index]['selesai']
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                ),
              ),
              subtitle: Text(kegiatan[index]['tanggal']),
              value: kegiatan[index]['selesai'],
              onChanged: (value) {
                setState(() {
                  kegiatan[index]['selesai'] = value!;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
