class LocalityModel {
  final String id;
  final String name;
  final String slug;
  final String status;
  final DateTime createdAt;

  LocalityModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.status,
    required this.createdAt,
  });

  // Factory constructor to create an instance from JSON
  factory LocalityModel.fromJson(Map<String, dynamic> json) {
    return LocalityModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

}