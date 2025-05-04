import 'package:flutter/material.dart';
import 'kasir_screen.dart';  // Pastikan diimpor
import 'stokproduk_screen.dart'; // Pastikan juga diimpor

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);  // Menambahkan key pada konstruktor

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
                    _buildButton(Icons.add_shopping_cart, 'Kasir', context), // Menghubungkan ke KasirScreen
                    _buildButton(Icons.store, 'Stok Produk', context), // Menghubungkan ke StokProdukScreen
                    _buildButton(Icons.bar_chart, 'Laporan', context),
                    _buildButton(Icons.settings, 'Pengaturan', context),
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
  Widget _buildButton(IconData icon, String label, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            if (label == 'Kasir') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KasirScreen()), // Menghapus const
              );
            } else if (label == 'Stok Produk') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StokProdukScreen()), // Menghapus const
              );
            }
            // Tambahkan navigasi untuk tombol lainnya jika perlu
          },
          icon: Icon(icon, size: 30, color: Colors.blue),
        ),
        Text(label, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
