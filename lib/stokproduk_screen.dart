import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class StokProdukScreen extends StatefulWidget {
  @override
  _StokProdukScreenState createState() => _StokProdukScreenState();
}

class _StokProdukScreenState extends State<StokProdukScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;  // Inisialisasi TabController
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref();

  // Data produk makanan dan minuman
  List<Map<String, dynamic>> makananList = [];
  List<Map<String, dynamic>> minumanList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);  // Inisialisasi TabController untuk 2 tab

    // Menambahkan listener untuk real-time update data dari Firebase
    _databaseRef.child('produk/makanan').onValue.listen((event) {
      var snapshot = event.snapshot;
      if (snapshot.exists) {
        var makananData = snapshot.value as Map;
        setState(() {
          makananList.clear();
          makananData.forEach((key, value) {
            makananList.add({
              'key': key,
              'nama': value['nama'],
              'stok': value['stok'],
            });
          });
        });
      }
    });

    _databaseRef.child('produk/minuman').onValue.listen((event) {
      var snapshot = event.snapshot;
      if (snapshot.exists) {
        var minumanData = snapshot.value as Map;
        setState(() {
          minumanList.clear();
          minumanData.forEach((key, value) {
            minumanList.add({
              'key': key,
              'nama': value['nama'],
              'stok': value['stok'],
            });
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  // Fungsi untuk mengedit produk
  Future<void> _editProduct(BuildContext context, int index, bool isMakanan) async {
    TextEditingController namaController = TextEditingController(text: isMakanan ? makananList[index]['nama'] : minumanList[index]['nama']);
    TextEditingController stokController = TextEditingController(text: (isMakanan ? makananList[index]['stok'] : minumanList[index]['stok']).toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Produk'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // TextField untuk nama produk
              TextField(
                controller: namaController,
                decoration: InputDecoration(labelText: 'Nama Produk'),
              ),
              // TextField untuk stok produk
              TextField(
                controller: stokController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Stok Produk'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  if (isMakanan) {
                    makananList[index]['nama'] = namaController.text;
                    makananList[index]['stok'] = int.parse(stokController.text);
                    _updateProduct(makananList[index]['key'], namaController.text, int.parse(stokController.text), 'makanan');
                  } else {
                    minumanList[index]['nama'] = namaController.text;
                    minumanList[index]['stok'] = int.parse(stokController.text);
                    _updateProduct(minumanList[index]['key'], namaController.text, int.parse(stokController.text), 'minuman');
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text('Simpan'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Batal'),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk memperbarui produk di Firebase
  void _updateProduct(String key, String nama, int stok, String kategori) {
    _databaseRef.child('produk/$kategori/$key').update({
      'nama': nama,
      'stok': stok,
    });
  }

  // Fungsi untuk menambah produk baru
  Future<void> _addProduct(BuildContext context, bool isMakanan) async {
    TextEditingController namaController = TextEditingController();
    TextEditingController stokController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tambah Produk Baru'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // TextField untuk nama produk
              TextField(
                controller: namaController,
                decoration: InputDecoration(labelText: 'Nama Produk'),
              ),
              // TextField untuk stok produk
              TextField(
                controller: stokController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Stok Produk'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  if (isMakanan) {
                    var newProduct = _databaseRef.child('produk/makanan').push();
                    newProduct.set({
                      'nama': namaController.text,
                      'stok': int.parse(stokController.text),
                    });
                  } else {
                    var newProduct = _databaseRef.child('produk/minuman').push();
                    newProduct.set({
                      'nama': namaController.text,
                      'stok': int.parse(stokController.text),
                    });
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text('Simpan'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Batal'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stok Produk'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Makanan'),
            Tab(text: 'Minuman'),
          ],
        ),
      ),
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: [
              // Tampilan untuk Makanan
              SingleChildScrollView(
                child: Column(
                  children: [
                    ...makananList.map((item) {
                      int index = makananList.indexOf(item);
                      return Card(
                        margin: EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(item['nama']),
                          subtitle: Text('Stok: ${item['stok']}'),
                          trailing: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _editProduct(context, index, true),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
              // Tampilan untuk Minuman
              SingleChildScrollView(
                child: Column(
                  children: [
                    ...minumanList.map((item) {
                      int index = minumanList.indexOf(item);
                      return Card(
                        margin: EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(item['nama']),
                          subtitle: Text('Stok: ${item['stok']}'),
                          trailing: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _editProduct(context, index, false),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ],
          ),
          // Tombol "Tambah Produk" di bawah kanan
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () => _addProduct(context, _tabController?.index == 0),  // Menambah produk di tab yang aktif
                child: Icon(Icons.add),
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
