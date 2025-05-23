import 'package:flutter/material.dart';

class JadwalPage extends StatelessWidget {
  final List<Map<String, String>> jadwal = [
    {
      'hari': 'Senin',
      'mataKuliah': 'Pemrograman Berbasis Mobile 08:00 - 10:30',
    },
    {'hari': 'Senin', 'mataKuliah': 'E-Business 10:30 - 13:00'},
    {
      'hari': 'Selasa',
      'mataKuliah': 'Prak. Pemrograman Berbasis Mobile 13:50 - 16:20',
    },
    {'hari': 'Selasa', 'mataKuliah': 'Metodologi Penelitian 11:20 - 13:50'},
    {'hari': 'Rabu', 'mataKuliah': 'Manajemen Proyek 09:40 - 12:10'},
    {
      'hari': 'Kamis',
      'mataKuliah': 'Enterprise Software Engineering 10:30 - 13:00',
    },
    {'hari': 'Jumat', 'mataKuliah': 'Geoinformatika 08:01 - 09:40'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color:
          theme.brightness == Brightness.dark
              ? Colors.black
              : Colors.lightBlue[50],
      padding: const EdgeInsets.all(8),
      child: ListView(
        children:
            jadwal.map((item) {
              return Card(
                color: theme.cardColor,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: ListTile(
                  leading: const Icon(Icons.calendar_today, color: Colors.blue),
                  title: Text(
                    item['hari']!,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      item['mataKuliah']!,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  trailing: const Icon(Icons.access_time, color: Colors.grey),
                ),
              );
            }).toList(),
      ),
    );
  }
}
