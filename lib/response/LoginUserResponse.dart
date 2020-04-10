
import 'common/LoginUser.dart';

class LoginUserResponse {
  bool success;
  String description;
  List<LoginUser> data;

  LoginUserResponse({this.success, this.description, this.data});

  LoginUserResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    description = json['description'];
    if (json['data'] != null) {
      data = new List<LoginUser>();
      json['data'].forEach((v) {
        data.add(new LoginUser.fromJson(v));
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