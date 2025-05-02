import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background Image
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/store_background.jpg',  // Ganti dengan path gambar background yang sesuai
              fit: BoxFit.cover,
            ),
          ),
          // Konten di atas background
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profil (Avatar, Nama, Role)
                Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/profile_image.png'), // Ganti dengan gambar profil
                    ),
                    SizedBox(height: 10),
                    Text('Abang', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text('Owner', style: TextStyle(fontSize: 16, color: Colors.grey)),
                    SizedBox(height: 30),
                  ],
                ),
                // Tombol untuk Kasir, Stok Produk, Laporan, Pengaturan
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton(Icons.add_shopping_cart, 'Kasir'),
                    _buildButton(Icons.store, 'Stok Produk'),
                    _buildButton(Icons.bar_chart, 'Laporan'),
                    _buildButton(Icons.settings, 'Pengaturan'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat tombol
  Widget _buildButton(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon, size: 30, color: Colors.blue),
        ),
        Text(label, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
