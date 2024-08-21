import 'package:get_my_properties/data/models/response/property_model.dart';

class PropertyDetailModel {
  String? sId;
  String? uniqueId;
  String? userType;
  String? userId;
  TypeId? typeId;
  TypeId? purposeId;
  // Null? listingPackageId;
  TypeId? categoryId;
  List<Amenity>? amenityId;
  String? slug;
  String? title;
  String? description;
  String? metaTitle;
  String? metaDescription;
  String? address;
  int? views;
  int? unit;
  FileId? fileId;
  DisplayImageId? displayImageId;
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
  String? countryId;
  TypeId? stateId;
  TypeId? cityId;
  List<Locality>? localityId;
  double? latitude;
  double? longitude;
  String? status;
  bool? isDeleted;
  LocationMdl? location;
  String? createdAt;

  PropertyDetailModel(
      {this.sId,
        this.uniqueId,
        this.userType,
        this.userId,
        this.typeId,
        this.purposeId,
        // this.listingPackageId,
        this.categoryId,
        this.amenityId,
        this.slug,
        this.title,
        this.description,
        this.metaTitle,
        this.metaDescription,
        this.address,
        this.views,
        this.unit,
        this.fileId,
        this.displayImageId,
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
        this.countryId,
        this.stateId,
        this.cityId,
        this.localityId,
        this.latitude,
        this.longitude,
        this.status,
        this.isDeleted,
        this.location,
        this.createdAt});

  PropertyDetailModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    uniqueId = json['unique_id'];
    userType = json['user_type'];
    userId = json['user_id'];
    typeId =
    json['type_id'] != null ? new TypeId.fromJson(json['type_id']) : null;
    purposeId = json['purpose_id'] != null
        ? new TypeId.fromJson(json['purpose_id'])
        : null;
    // listingPackageId = json['listing_package_id'];
    categoryId = json['category_id'] != null
        ? new TypeId.fromJson(json['category_id'])
        : null;
    if (json['amenity_id'] != null) {
      amenityId = <Amenity>[];
      json['amenity_id'].forEach((v) {
        amenityId!.add(new Amenity.fromJson(v));
      });
    }
    slug = json['slug'];
    title = json['title'];
    description = json['description'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    address = json['address'];
    views = json['views'];
    unit = json['unit'];
    fileId =
    json['file_id'] != null ? new FileId.fromJson(json['file_id']) : null;
    displayImageId = json['display_image_id'] != null
        ? new DisplayImageId.fromJson(json['display_image_id'])
        : null;
    if (json['gallery_images'] != null) {
      galleryImages = <GalleryImages>[];
      json['gallery_images'].forEach((v) {
        galleryImages!.add(new GalleryImages.fromJson(v));
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
    countryId = json['country_id'];
    stateId =
    json['state_id'] != null ? new TypeId.fromJson(json['state_id']) : null;
    cityId =
    json['city_id'] != null ? new TypeId.fromJson(json['city_id']) : null;
    if (json['locality_id'] != null) {
      localityId = <Locality>[];
      json['locality_id'].forEach((v) {
        localityId!.add(new Locality.fromJson(v));
      });
    }
    latitude = json['latitude'];
    longitude = json['longitude'];
    status = json['status'];
    isDeleted = json['is_deleted'];
    location = json['location'] != null
        ? new LocationMdl.fromJson(json['location'])
        : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['unique_id'] = this.uniqueId;
    data['user_type'] = this.userType;
    data['user_id'] = this.userId;
    if (this.typeId != null) {
      data['type_id'] = this.typeId!.toJson();
    }
    if (this.purposeId != null) {
      data['purpose_id'] = this.purposeId!.toJson();
    }
    // data['listing_package_id'] = this.listingPackageId;
    if (this.categoryId != null) {
      data['category_id'] = this.categoryId!.toJson();
    }
    if (this.amenityId != null) {
      data['amenity_id'] = this.amenityId!.map((v) => v.toJson()).toList();
    }
    data['slug'] = this.slug;
    data['title'] = this.title;
    data['description'] = this.description;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['address'] = this.address;
    data['views'] = this.views;
    data['unit'] = this.unit;
    if (this.fileId != null) {
      data['file_id'] = this.fileId!.toJson();
    }
    if (this.displayImageId != null) {
      data['display_image_id'] = this.displayImageId!.toJson();
    }
    if (this.galleryImages != null) {
      data['gallery_images'] =
          this.galleryImages!.map((v) => v.toJson()).toList();
    }
    data['video_link'] = this.videoLink;
    data['room'] = this.room;
    data['space'] = this.space;
    data['bedroom'] = this.bedroom;
    data['bathroom'] = this.bathroom;
    data['floor'] = this.floor;
    data['kitchen'] = this.kitchen;
    data['built_year'] = this.builtYear;
    data['area'] = this.area;
    data['direction'] = this.direction;
    data['price'] = this.price;
    data['market_price'] = this.marketPrice;
    data['is_featured'] = this.isFeatured;
    data['top_property'] = this.topProperty;
    data['expiry_date'] = this.expiryDate;
    data['country_id'] = this.countryId;
    if (this.stateId != null) {
      data['state_id'] = this.stateId!.toJson();
    }
    if (this.cityId != null) {
      data['city_id'] = this.cityId!.toJson();
    }
    if (this.localityId != null) {
      data['locality_id'] = this.localityId!.map((v) => v.toJson()).toList();
    }
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['status'] = this.status;
    data['is_deleted'] = this.isDeleted;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class TypeId {
  String? sId;
  String? name;

  TypeId({this.sId, this.name});

  TypeId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}

class FileId {
  String? sId;
  String? value;

  FileId({this.sId, this.value});

  FileId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['value'] = this.value;
    return data;
  }
}

class DisplayImageId {
  String? sId;
  String? image;

  DisplayImageId({this.sId, this.image});

  DisplayImageId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['image'] = this.image;
    return data;
  }
}

class LocationMdl {
  String? type;
  List<double>? coordinates;

  LocationMdl({this.type, this.coordinates});

  LocationMdl.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
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

