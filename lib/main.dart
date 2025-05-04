import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';  // Pastikan sudah mengimpor package ini
import 'home_screen.dart';  // Ganti dengan screen yang sesuai

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Menjaga aplikasi tetap berjalan sampai Firebase siap

  await Firebase.initializeApp();  // Menjalankan inisialisasi Firebase
  runApp(MyApp());  // Setelah Firebase diinisialisasi, baru jalankan aplikasi
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Berkat Jaya',
      home: HomeScreen(),  // Ganti dengan screen yang sesuai
    );
  }
}
