class VendorDashboardModel {
  int totalProperty;
  int totalApproved;
  int totalPending;
  int totalRejected;
  int totalDisabled;
  int totalFeatured;
  List<dynamic> featuredProperties; // Adjust this if you have a specific model for featuredProperties
  List<LatestInquiries> latestInquiries;

  VendorDashboardModel({
    required this.totalProperty,
    required this.totalApproved,
    required this.totalPending,
    required this.totalRejected,
    required this.totalDisabled,
    required this.totalFeatured,
    required this.featuredProperties,
    required this.latestInquiries,
  });

  VendorDashboardModel.fromJson(Map<String, dynamic> json)
      : totalProperty = json['total_property'],
        totalApproved = json['total_approved'],
        totalPending = json['total_pending'],
        totalRejected = json['total_rejected'],
        totalDisabled = json['total_disabled'],
        totalFeatured = json['total_featured'],
        featuredProperties = json['featured_properties'] != null
            ? List<dynamic>.from(json['featured_properties'])
            : [],
        latestInquiries = json['latest_inquiries'] != null
            ? (json['latest_inquiries'] as List)
            .map((i) => LatestInquiries.fromJson(i))
            .toList()
            : [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_property'] = totalProperty;
    data['total_approved'] = totalApproved;
    data['total_pending'] = totalPending;
    data['total_rejected'] = totalRejected;
    data['total_disabled'] = totalDisabled;
    data['total_featured'] = totalFeatured;
    data['featured_properties'] = featuredProperties; // Adjust if needed
    data['latest_inquiries'] = latestInquiries.map((i) => i.toJson()).toList();
    return data;
  }
}

class LatestInquiries {
  String sId;
  String propertyId;
  String venderId;
  String name;
  int phoneNumber;
  String email;
  String message;
  String status;
  bool isDeleted;
  String createdAt;
  String updatedAt;
  int iV;

  LatestInquiries({
    required this.sId,
    required this.propertyId,
    required this.venderId,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.message,
    required this.status,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.iV,
  });

  LatestInquiries.fromJson(Map<String, dynamic> json)
      : sId = json['_id'],
        propertyId = json['property_id'],
        venderId = json['vender_id'],
        name = json['name'],
        phoneNumber = json['phone_number'],
        email = json['email'],
        message = json['message'],
        status = json['status'],
        isDeleted = json['is_deleted'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'],
        iV = json['__v'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['property_id'] = propertyId;
    data['vender_id'] = venderId;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['message'] = message;
    data['status'] = status;
    data['is_deleted'] = isDeleted;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
