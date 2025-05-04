import 'package:flutter/material.dart';

class StokProdukScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stok Produk'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Aksi untuk edit produk
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian Makanan
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Makanan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5, // Jumlah makanan
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(Icons.fastfood),
                    title: Text('Makanan ${index + 1}'),
                    subtitle: Text('Deskripsi makanan'),
                    trailing: Icon(Icons.edit),
                    onTap: () {
                      // Aksi edit produk
                    },
                  ),
                );
              },
            ),
            
            // Bagian Minuman
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Minuman',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5, // Jumlah minuman
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(Icons.local_drink),
                    title: Text('Minuman ${index + 1}'),
                    subtitle: Text('Deskripsi minuman'),
                    trailing: Icon(Icons.edit),
                    onTap: () {
                      // Aksi edit produk
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
