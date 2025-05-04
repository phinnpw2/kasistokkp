import 'package:flutter/material.dart';

class KasirScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange, // Warna sesuai dengan desain Figma
        title: Text('Kasir'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              // Logika untuk keluar/log out
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Grid Produk
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Pilih Produk',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Sesuaikan jumlah kolom produk
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 6, // Sesuaikan dengan jumlah produk
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Logika untuk menambah produk ke keranjang
                  },
                  child: Card(
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/product_image.png'), // Ganti dengan gambar produk
                        Text('Nama Produk'),
                        Text('Rp 20,000'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Bagian Total Harga
          Container(
            color: Colors.orange[100],
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Total Harga',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Rp 60,000', // Tampilkan total harga
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                // Tombol Bayar
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Warna tombol sesuai desain
                    minimumSize: Size(double.infinity, 50), // Ukuran tombol
                  ),
                  onPressed: () {
                    // Logika untuk pembayaran
                    _showPaymentModal(context); // Menampilkan modal pembayaran
                  },
                  child: Text(
                    'Bayar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Modal untuk memilih metode pembayaran
  void _showPaymentModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Pilih Metode Pembayaran'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Tunai'),
              onTap: () {
                Navigator.pop(context); // Pilih tunai dan tutup modal
              },
            ),
            ListTile(
              title: Text('Kartu Kredit'),
              onTap: () {
                Navigator.pop(context); // Pilih kartu kredit dan tutup modal
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Tutup modal
            },
            child: Text('Batal'),
          ),
        ],
      ),
    );
  }
}