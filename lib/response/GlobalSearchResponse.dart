
import 'package:highqfresh/response/GlobalSearchData.dart';

class GlobalSearchResponse{
  bool success;
  String description;
  GlobalSearchData data;

  GlobalSearchResponse({this.success, this.description, this.data});

  GlobalSearchResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    description = json['description'];
    data = json['data'] != null ? new GlobalSearchData.fromJson(json['data']) : null;
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