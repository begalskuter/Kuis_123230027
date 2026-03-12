import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // --- Foto Profil ---
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue.shade100,
                child: const Icon(Icons.person, size: 60, color: Colors.blue),
              ),
              const SizedBox(height: 16),

              // --- Nama dan Role ---
              Text(
                username, // ✅ VARIABLE
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Software Developer',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),

              const Divider(),

              // --- Informasi Detail ---
              const ListTile(
                leading: Icon(Icons.email_outlined, color: Colors.black54),
                title: Text('Email'),
                subtitle: Text('respect@banget.com'),
              ),
              const ListTile(
                leading: Icon(Icons.phone_outlined, color: Colors.black54),
                title: Text('Phone'),
                subtitle: Text('+62 822 1785 1300'),
              ),
              const ListTile(
                leading: Icon(
                  Icons.location_on_outlined,
                  color: Colors.black54,
                ),
                title: Text('Location'),
                subtitle: Text('Kota, Indonesia'),
              ),

              const SizedBox(height: 32),

              // --- Tombol Edit Profil / Logout ---
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Tambahkan aksi di sini
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Fitur belum tersedia')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.red.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
