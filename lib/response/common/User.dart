import 'package:highqfresh/utils/EncrtptDecrypt.dart';

class User {
  int id;
  String name;
  String address;
  String mobile_no;
  int user_status;
  String user_name;
  String password;
  double latitude;
  double longitude;
  String date_created;
  String date_modified;
  String email_id;
  String profile_image;
  String android_authentication_code;
  String android_authentication_expired_time;
  String web_authentication_code;
  String web_authentication_expired_time;

  User(
      {this.id,
        this.name,
        this.address,
        this.mobile_no,
        this.user_status,
        this.user_name,
        this.password,
        this.latitude,
        this.longitude,
        this.date_created,
        this.date_modified,
        this.email_id,
        this.profile_image,
        this.android_authentication_code,
        this.android_authentication_expired_time,
        this.web_authentication_code,
        this.web_authentication_expired_time,
      });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    mobile_no = json['mobile_no'];
    user_status = json['user_status'];
    user_name = json['user_name'];
    password = json['password'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    date_created =  json['date_created'];
    date_modified = json['date_modified'];
    email_id = json['email_id'];
    profile_image = json['profile_image'];
    android_authentication_code = json['android_authentication_code'];
    android_authentication_expired_time = json['android_authentication_expired_time'];
    web_authentication_code = json['web_authentication_code'];
    web_authentication_expired_time = json['web_authentication_expired_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['mobile_no'] = this.mobile_no;
    data['user_status'] = this.user_status;
    data['user_name'] = this.user_name;
    data['password'] = this.password;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['date_created'] = this.date_created;
    data['date_modified'] = this.date_modified;
    data['email_id'] = this.email_id;
    data['profile_image'] = this.profile_image;
    data['android_authentication_code'] = this.android_authentication_code;
    data['android_authentication_expired_time'] = this.android_authentication_expired_time;
    data['web_authentication_code'] = this.web_authentication_code;
    data['web_authentication_expired_time'] = this.web_authentication_expired_time;
    return data;
  }
}
