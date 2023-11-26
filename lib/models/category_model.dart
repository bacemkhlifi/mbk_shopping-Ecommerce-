class Category {
  final String name;

  Category({required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'] ?? '',
    );
  }
}
class CategoryStatic {
  final String title;
  final String image;

  CategoryStatic({
    required this.title,
    required this.image,
  });
}