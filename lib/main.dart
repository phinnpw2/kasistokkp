import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// Jangan lupa impor database
import 'home_screen.dart'; // Ganti dengan screen yang sesuai

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Menjaga aplikasi tetap berjalan sampai Firebase siap

  // Inisialisasi Firebase dengan konfigurasi yang benar
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "YOUR_API_KEY",  // Masukkan API key yang sesuai dengan project Firebase Anda
      authDomain: "YOUR_PROJECT_ID.firebaseapp.com",  // Sesuaikan dengan project ID Anda
      databaseURL: "https://kasirstokkp-default-rtdb.asia-southeast1.firebasedatabase.app/", // URL Realtime Database Anda
      projectId: "YOUR_PROJECT_ID",
      storageBucket: "YOUR_PROJECT_ID.appspot.com",
      messagingSenderId: "YOUR_SENDER_ID",
      appId: "YOUR_APP_ID",
      measurementId: "YOUR_MEASUREMENT_ID",
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
