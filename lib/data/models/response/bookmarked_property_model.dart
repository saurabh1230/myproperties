class BookmarkPropertyModel {
  String? id;
  String? uniqueId;
  String? userType;
  String? slug;
  String? title;
  String? description;
  String? metaTitle;
  String? metaDescription;
  String? address;
  int? views;
  int? unit;
  List<dynamic>? galleryImages;
  String? videoLink;
  int? room;
  int? space;
  int? bedroom;
  int? bathroom;
  int? floor;
  int? kitchen;
  int? builtYear;
  int? area;
  String? direction;
  int? price;
  int? marketPrice;
  bool? isFeatured;
  bool? topProperty;
  DateTime? expiryDate;
  String? status;
  DateTime? createdAt;
  PropertyType? type;
  PropertyPurpose? purpose;
  PropertyCategory? category;
  DisplayImage? displayImage;

  BookmarkPropertyModel({
    this.id,
    this.uniqueId,
    this.userType,
    this.slug,
    this.title,
    this.description,
    this.metaTitle,
    this.metaDescription,
    this.address,
    this.views,
    this.unit,
    this.galleryImages,
    this.videoLink,
    this.room,
    this.space,
    this.bedroom,
    this.bathroom,
    this.floor,
    this.kitchen,
    this.builtYear,
    this.area,
    this.direction,
    this.price,
    this.marketPrice,
    this.isFeatured,
    this.topProperty,
    this.expiryDate,
    this.status,
    this.createdAt,
    this.type,
    this.purpose,
    this.category,
    this.displayImage,
  });

  // fromJson method to parse JSON data
  factory BookmarkPropertyModel.fromJson(Map<String, dynamic> json) {
    return BookmarkPropertyModel(
      id: json['_id'],
      uniqueId: json['unique_id'],
      userType: json['user_type'],
      slug: json['slug'],
      title: json['title'],
      description: json['description'],
      metaTitle: json['meta_title'],
      metaDescription: json['meta_description'],
      address: json['address'],
      views: json['views'],
      unit: json['unit'],
      galleryImages: List<dynamic>.from(json['gallery_images']),
      videoLink: json['video_link'],
      room: json['room'],
      space: json['space'],
      bedroom: json['bedroom'],
      bathroom: json['bathroom'],
      floor: json['floor'],
      kitchen: json['kitchen'],
      builtYear: json['built_year'],
      area: json['area'],
      direction: json['direction'],
      price: json['price'],
      marketPrice: json['market_price'],
      isFeatured: json['is_featured'],
      topProperty: json['top_property'],
      expiryDate: DateTime.parse(json['expiry_date']),
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      type: PropertyType.fromJson(json['type']),
      purpose: PropertyPurpose.fromJson(json['purpose']),
      category: PropertyCategory.fromJson(json['category']),
      displayImage: DisplayImage.fromJson(json['display_image']),
    );
  }

  // toJson method to convert Dart object back to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'unique_id': uniqueId,
      'user_type': userType,
      'slug': slug,
      'title': title,
      'description': description,
      'meta_title': metaTitle,
      'meta_description': metaDescription,
      'address': address,
      'views': views,
      'unit': unit,
      'gallery_images': galleryImages,
      'video_link': videoLink,
      'room': room,
      'space': space,
      'bedroom': bedroom,
      'bathroom': bathroom,
      'floor': floor,
      'kitchen': kitchen,
      'built_year': builtYear,
      'area': area,
      'direction': direction,
      'price': price,
      'market_price': marketPrice,
      'is_featured': isFeatured,
      'top_property': topProperty,
      'expiry_date': expiryDate?.toIso8601String(),
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'type': type?.toJson(),
      'purpose': purpose?.toJson(),
      'category': category?.toJson(),
      'display_image': displayImage?.toJson(),
    };
  }
}

class PropertyType {
  String? id;
  String? name;

  PropertyType({this.id, this.name});

  factory PropertyType.fromJson(Map<String, dynamic> json) {
    return PropertyType(
      id: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}

class PropertyPurpose {
  String? id;
  String? name;

  PropertyPurpose({this.id, this.name});

  factory PropertyPurpose.fromJson(Map<String, dynamic> json) {
    return PropertyPurpose(
      id: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}

class PropertyCategory {
  String? id;
  String? name;

  PropertyCategory({this.id, this.name});

  factory PropertyCategory.fromJson(Map<String, dynamic> json) {
    return PropertyCategory(
      id: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}

class DisplayImage {
  String? id;
  String? image;

  DisplayImage({this.id, this.image});

  factory DisplayImage.fromJson(Map<String, dynamic> json) {
    return DisplayImage(
      id: json['_id'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'image': image,
    };
  }
}
