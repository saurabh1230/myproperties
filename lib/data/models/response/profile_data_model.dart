class ProfileDataModel {
  String? sId;
  String? name;
  String? email;
  String? profileImage;
  int? phoneNumber;
  String? address;
  String? userType;

  ProfileDataModel(
      {this.sId,
        this.name,
        this.email,
        this.profileImage,
        this.phoneNumber,
        this.address,
        this.userType});

  ProfileDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    profileImage = json['profile_image'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profile_image'] = this.profileImage;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['user_type'] = this.userType;
    return data;
  }
}
