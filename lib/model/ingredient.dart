class Ingredient {
  final int id;
  final String name;
  final String image;

  Ingredient({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    String imageUrl = map['image'];
    return Ingredient(
      id: map['id'],
      name: map['name'],
      image: imageUrl,
    );
  }
}
