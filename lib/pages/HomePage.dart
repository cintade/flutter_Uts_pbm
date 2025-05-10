import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> kegiatan = [
    {'nama': 'Rapat Karate', 'tanggal': 'Senin, 6 Mei', 'selesai': false},
    {'nama': 'Praktikum PBM', 'tanggal': 'Selasa, 7 Mei', 'selesai': false},
    {'nama': 'Nugas MP', 'tanggal': 'Rabu, 8 Mei', 'selesai': false},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color:
          theme.brightness == Brightness.dark
              ? Colors.grey[900]
              : Colors.teal[50],
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: kegiatan.length,
        itemBuilder: (context, index) {
          final item = kegiatan[index];
          final selesai = item['selesai'] as bool;

          return Card(
            color:
                selesai
                    ? (theme.brightness == Brightness.dark
                        ? Colors.green[800]
                        : Colors.green[100])
                    : theme.cardColor,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: CheckboxListTile(
              activeColor: Colors.teal,
              title: Text(
                item['nama'],
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  decoration:
                      selesai
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                ),
              ),
              subtitle: Text(item['tanggal'], style: theme.textTheme.bodySmall),
              value: selesai,
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
