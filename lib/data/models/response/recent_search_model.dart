class RecentSearchModel {
  final String? sId;
  final String? value;
  final DateTime? createdAt;

  RecentSearchModel({this.sId, this.value, this.createdAt});

  factory RecentSearchModel.fromJson(Map<String, dynamic> json) {
    return RecentSearchModel(
      sId: json['_id'] as String?,
      value: json['value'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': sId,
      'value': value,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
