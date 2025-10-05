import 'package:flutter/material.dart';
import '../../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard Principal')),
      drawer: const CustomDrawer(),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'Inicio de la aplicación. Usa el menú lateral para navegar entre las diferentes vistas y demos.',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
