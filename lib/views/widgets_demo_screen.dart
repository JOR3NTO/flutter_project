import 'package:flutter/material.dart';

class WidgetsDemoScreen extends StatefulWidget {
  const WidgetsDemoScreen({super.key});

  @override
  State<WidgetsDemoScreen> createState() => _WidgetsDemoScreenState();
}

class _WidgetsDemoScreenState extends State<WidgetsDemoScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> items = List.generate(8, (i) => 'Elemento ${i + 1}');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo de Widgets'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.grid_on), text: 'GridView'),
            Tab(icon: Icon(Icons.info), text: 'Otro Widget'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(child: Text('Menú de ejemplo')),
            ListTile(leading: Icon(Icons.home), title: Text('Inicio')),
            ListTile(leading: Icon(Icons.settings), title: Text('Ajustes')),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // GridView ejemplo
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: items.map((e) => Card(
                color: Colors.blue[100],
                child: Center(child: Text(e)),
              )).toList(),
            ),
          ),
          // Otro widget: ListView
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: const [
              ListTile(leading: Icon(Icons.star), title: Text('Elemento destacado')),
              ListTile(leading: Icon(Icons.favorite), title: Text('Favorito')),
              ListTile(leading: Icon(Icons.person), title: Text('Perfil')),
            ],
          ),
        ],
      ),
    );
  }
}
