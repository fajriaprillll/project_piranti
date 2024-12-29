import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar Pengguna
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                    'assets/avatar.jpg'), // Ganti dengan gambar avatar
              ),
              SizedBox(height: 16),
              // Nama Pengguna dan Email
              Text(
                "John Doe",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                ),
              ),
              SizedBox(height: 8),
              Text(
                "johndoe@gmail.com",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.orange[600],
                ),
              ),
              SizedBox(height: 24),
              // Tombol Edit Profil
              ElevatedButton.icon(
                onPressed: () {
                  // Navigasi atau aksi pengeditan profil
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Mengedit Profil")),
                  );
                },
                icon: Icon(Icons.edit, color: Colors.white),
                label: Text("Edit Profil"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 24),
              // Menu Pengaturan
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Pengaturan Umum
                    ListTile(
                      leading: Icon(Icons.account_circle, color: Colors.orange),
                      title: Text("Akun dan Keamanan"),
                      trailing:
                          Icon(Icons.arrow_forward_ios, color: Colors.orange),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Akun dan Keamanan")),
                        );
                      },
                    ),
                    Divider(),
                    // Pengaturan Notifikasi
                    ListTile(
                      leading: Icon(Icons.notifications, color: Colors.orange),
                      title: Text("Notifikasi"),
                      trailing:
                          Icon(Icons.arrow_forward_ios, color: Colors.orange),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Pengaturan Notifikasi")),
                        );
                      },
                    ),
                    Divider(),
                    // Pengaturan Privasi
                    ListTile(
                      leading: Icon(Icons.lock, color: Colors.orange),
                      title: Text("Privasi"),
                      trailing:
                          Icon(Icons.arrow_forward_ios, color: Colors.orange),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Pengaturan Privasi")),
                        );
                      },
                    ),
                    Divider(),
                    // Pengaturan Keluar
                    ListTile(
                      leading: Icon(Icons.exit_to_app, color: Colors.orange),
                      title: Text("Keluar"),
                      trailing:
                          Icon(Icons.arrow_forward_ios, color: Colors.orange),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Keluar dari aplikasi")),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
