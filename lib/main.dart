import 'package:flutter/material.dart';

import 'screens/pantalla_asistencia.dart';


///
void main() {
  runApp(const AppAsistencia());
}

class AppAsistencia extends StatelessWidget {
  const AppAsistencia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asistencia Ingeniebros',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1B4D3E),
        ),
        useMaterial3: true,
      ),
      home: const PantallaAsistencia(),
    );
  }
}