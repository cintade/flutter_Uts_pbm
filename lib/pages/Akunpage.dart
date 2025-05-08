import 'package:flutter/material.dart';

class AkunPage extends StatefulWidget {
  final Function(bool) onThemeToggle;
  const AkunPage({super.key, required this.onThemeToggle});

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[900]
              : Colors.blue[50],
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // FOTO PROFIL
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('assets/profil.jpg'),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Cinta Delia Yunus",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // INFO
          Card(
            color: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.badge, color: Colors.blue),
                  title: Text("NIM"),
                  subtitle: Text("4522210143"),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.email, color: Colors.blue),
                  title: Text("Email"),
                  subtitle: Text("4522210143@univpancasila.ac.id"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // TOGGLE MODE
          Card(
            color: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: SwitchListTile(
              title: const Text("Mode Gelap"),
              secondary: const Icon(Icons.dark_mode, color: Colors.deepPurple),
              value: _isDark,
              onChanged: (value) {
                setState(() {
                  _isDark = value;
                });
                widget.onThemeToggle(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
