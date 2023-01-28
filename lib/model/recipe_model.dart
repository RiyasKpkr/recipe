class Recipe {
  final String? name;
  final String? images;
  final double? rating;
  final String? totaltime;

  Recipe({
    required this.images,
    required this.name,
    required this.rating,
    required this.totaltime,
  });

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      images: json['images'][0]['hostedLargeUrl'] as String,
      name: json['displayName'] as String,
      rating: json['rating'] as double,
      totaltime: json['totalTime'] as String,
    );
  }

  static List<Recipe> recipesFromsnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image:$images, rating:$rating, totalTime:$totaltime}';
  }
}
