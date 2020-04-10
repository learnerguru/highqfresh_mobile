
import 'HomeRecentData.dart';

class HomeRecentResponse{
  bool success;
  String description;
  HomeRecentData data;

  HomeRecentResponse({this.success, this.description, this.data});

  HomeRecentResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    description = json['description'];
    data = json['data'] != null ? new HomeRecentData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['description'] = this.description;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}