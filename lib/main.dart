import 'package:catalogo_front/home_page.dart';
import 'package:catalogo_front/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Talos",
      theme: ThemeData(
        primarySwatch: Colors.brown,
        primaryColor: const Color.fromRGBO(179, 162, 133, 0.5),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
