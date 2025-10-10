class DogBreed {
  final String name;
  final String imageUrl;

  DogBreed({required this.name, required this.imageUrl});

  factory DogBreed.fromJson(String name, String imageUrl) {
    return DogBreed(name: name, imageUrl: imageUrl);
  }
}
