import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import HomeScreen yang baru dibuat
import 'package:firebase_core/firebase_core.dart';  // Menambahkan import Firebase Core

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print("Firebase Initialized");  // Tambahkan log untuk memastikan Firebase berjalan
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kasir Toko Berkat Jaya',
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Menambahkan tema aplikasi
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),  // Menampilkan HomeScreen
    );
  }
}
