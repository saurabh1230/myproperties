class PropertyModel {
  String? sId;
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
  List<GalleryImages>? galleryImages;
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
  String? expiryDate;
  String? status;
  String? createdAt;
  Type? type;
  Type? purpose;
  Type? category;
  List<Amenity>? amenity;
  GalleryImages? displayImage;
  Type? state;
  Type? city;
  List<Locality>? locality;

  PropertyModel({
    this.sId,
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
    this.amenity,
    this.displayImage,
    this.state,
    this.city,
    this.locality,
  });

  PropertyModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    uniqueId = json['unique_id'];
    userType = json['user_type'];
    slug = json['slug'];
    title = json['title'];
    description = json['description'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    address = json['address'];
    views = json['views'];
    unit = json['unit'];
    if (json['gallery_images'] != null) {
      galleryImages = <GalleryImages>[];
      json['gallery_images'].forEach((v) {
        galleryImages!.add(GalleryImages.fromJson(v));
      });
    }

    videoLink = json['video_link'];
    room = json['room'];
    space = json['space'];
    bedroom = json['bedroom'];
    bathroom = json['bathroom'];
    floor = json['floor'];
    kitchen = json['kitchen'];
    builtYear = json['built_year'];
    area = json['area'];
    direction = json['direction'];
    price = json['price'];
    marketPrice = json['market_price'];
    isFeatured = json['is_featured'];
    topProperty = json['top_property'];
    expiryDate = json['expiry_date'];
    status = json['status'];
    createdAt = json['created_at'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;

    purpose = json['purpose'] != null ? Type.fromJson(json['purpose']) : null;
    category = json['category'] != null ? Type.fromJson(json['category']) : null;
    if (json['amenity'] != null) {
      amenity = <Amenity>[];
      json['amenity'].forEach((v) {
        amenity!.add(Amenity.fromJson(v));
      });
    }
    displayImage = json['display_image'] != null ? GalleryImages.fromJson(json['display_image']) : null;
    state = json['state'] != null ? Type.fromJson(json['state']) : null;
    city = json['city'] != null ? Type.fromJson(json['city']) : null;
    if (json['locality'] != null) {
      locality = <Locality>[];
      json['locality'].forEach((v) {
        locality!.add(Locality.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['unique_id'] = uniqueId;
    data['user_type'] = userType;
    data['slug'] = slug;
    data['title'] = title;
    data['description'] = description;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['address'] = address;
    data['views'] = views;
    data['unit'] = unit;
    if (galleryImages != null) {
      data['gallery_images'] = galleryImages!.map((v) => v.toJson()).toList();
    }
    data['video_link'] = videoLink;
    data['room'] = room;
    data['space'] = space;
    data['bedroom'] = bedroom;
    data['bathroom'] = bathroom;
    data['floor'] = floor;
    data['kitchen'] = kitchen;
    data['built_year'] = builtYear;
    data['area'] = area;
    data['direction'] = direction;
    data['price'] = price;
    data['market_price'] = marketPrice;
    data['is_featured'] = isFeatured;
    data['top_property'] = topProperty;
    data['expiry_date'] = expiryDate;
    data['status'] = status;
    data['created_at'] = createdAt;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    if (purpose != null) {
      data['purpose'] = purpose!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (amenity != null) {
      data['amenity'] = amenity!.map((v) => v.toJson()).toList();
    }
    if (displayImage != null) {
      data['display_image'] = displayImage!.toJson();
    }
    if (state != null) {
      data['state'] = state!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (locality != null) {
      data['locality'] = locality!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GalleryImages {
  String? sId;
  String? image;

  GalleryImages({this.sId, this.image});

  GalleryImages.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['image'] = image;
    return data;
  }
}

class Type {
  String? sId;
  String? name;

  Type({this.sId, this.name});

  Type.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class Amenity {
  String? sId;
  String? name;

  Amenity({this.sId, this.name});

  Amenity.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class Locality {
  String? sId;
  String? name;

  Locality({this.sId, this.name});

  Locality.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}
