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
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      color: isDarkMode ? Colors.grey[900] : Colors.blue[50],
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // FOTO PROFIL
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profil.jpg'),
                ),
                const SizedBox(height: 10),
                Text(
                  "Cinta Delia Yunus",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // INFO
          Card(
            color: theme.cardColor,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.badge, color: Colors.blue),
                  title: Text("NIM", style: theme.textTheme.bodyMedium),
                  subtitle: Text(
                    "4522210143",
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.email, color: Colors.blue),
                  title: Text("Email", style: theme.textTheme.bodyMedium),
                  subtitle: Text(
                    "4522210143@univpancasila.ac.id",
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // TOGGLE MODE
          Card(
            color: theme.cardColor,
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
