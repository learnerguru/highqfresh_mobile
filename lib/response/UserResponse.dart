
import 'common/User.dart';


class UserResponse {
  bool success;
  String description;
  List<User> data;

  UserResponse({this.success, this.description, this.data});

  UserResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    description = json['description'];
    if (json['data'] != null) {
      data = new List<User>();
      json['data'].forEach((v) {
        data.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['description'] = this.description;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}