import 'package:flutter/material.dart';
import '../../models/dog_breed.dart';
import '../../services/dog_service.dart';
import 'dog_detail_view.dart';
import 'package:go_router/go_router.dart';

class DogListView extends StatefulWidget {
  const DogListView({super.key});

  @override
  State<DogListView> createState() => _DogListViewState();
}

class _DogListViewState extends State<DogListView> {
  late Future<List<DogBreed>> _futureBreeds;
  final DogService _dogService = DogService();

  @override
  void initState() {
    super.initState();
    _futureBreeds = _dogService.fetchBreeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Razas de Perro')),
      body: FutureBuilder<List<DogBreed>>(
        future: _futureBreeds,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No se encontraron razas.'));
          }
          final breeds = snapshot.data!;
          return ListView.builder(
            itemCount: breeds.length,
            itemBuilder: (context, index) {
              final breed = breeds[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(breed.imageUrl),
                  backgroundColor: Colors.grey[200],
                ),
                title: Text(breed.name),
                onTap: () {
                  // Navegación usando go_router
                  context.pushNamed(
                    'dog_detail',
                    pathParameters: {'name': breed.name},
                    queryParameters: {'imageUrl': breed.imageUrl},
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
