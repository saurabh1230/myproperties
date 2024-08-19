class LocationModel {
  String id;
  String name;
  String status;
  DateTime createdAt;

  LocationModel({
    required this.id,
    required this.name,
    required this.status,
    required this.createdAt,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['_id'],
      name: json['name'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'status': status,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
