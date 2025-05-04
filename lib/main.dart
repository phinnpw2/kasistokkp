import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_screen.dart'; // Ganti dengan screen yang sesuai

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Menjaga aplikasi tetap berjalan sampai Firebase siap

  // Inisialisasi Firebase dengan konfigurasi yang benar
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyA8oIByjw5ADzeCjzEWB2hEzXFTgjffh14",  // Masukkan API key yang sesuai dengan project Firebase Anda
      authDomain: "kasirstokkp.firebaseapp.com",  // Sesuaikan dengan project ID Anda
      databaseURL: "https://kasirstokkp-default-rtdb.asia-southeast1.firebasedatabase.app/", // URL Realtime Database Anda
      projectId: "kasirstokkp",
      storageBucket: "kasirstokkp.firebasestorage.app",
      messagingSenderId: "1024131500228",
      appId: "1:1024131500228:web:9c3fbb1338543008a3a191",
      measurementId: "G-DKNKRSQGG2",
    ),
  );

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
