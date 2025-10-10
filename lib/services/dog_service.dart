import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/dog_breed.dart';

class DogService {
  static const String _baseUrl = 'https://dog.ceo/api';

  Future<List<DogBreed>> fetchBreeds() async {
    final url = Uri.parse('$_baseUrl/breeds/list/all');
    print('[DogService] Estado: Cargando razas de perro...');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print('[DogService] Estado: Éxito al obtener razas (status 200)');
        final data = json.decode(response.body);
        final breeds = data['message'] as Map<String, dynamic>;
        // Obtener una imagen real para cada raza (primera imagen random)
        List<DogBreed> breedList = [];
        for (final name in breeds.keys) {
          try {
            final imageUrl = await fetchBreedImage(name);
            breedList.add(DogBreed(name: name, imageUrl: imageUrl));
          } catch (_) {
            print('[DogService] Advertencia: No se pudo obtener imagen para $name');
            breedList.add(DogBreed(name: name, imageUrl: ''));
          }
        }
        print('[DogService] Estado: Listado de razas listo (${breedList.length} razas)');
        return breedList;
      } else {
        print('[DogService] Error: statusCode ${response.statusCode}');
        throw Exception('Error al obtener razas: ${response.statusCode}');
      }
    } catch (e) {
      print('[DogService] Error: $e');
      rethrow;
    }
  }

  Future<String> fetchBreedImage(String breed) async {
    final url = Uri.parse('$_baseUrl/breed/$breed/images/random');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['message'] as String;
      } else {
        throw Exception('Error al obtener imagen: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
