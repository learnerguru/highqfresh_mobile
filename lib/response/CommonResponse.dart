
class CommonResponse{
  bool success;
  String description;
  String data;

  CommonResponse({this.success, this.description, this.data});

  CommonResponse.fromJson(Map<String, dynamic> json) {
  success = json['success'];
  description = json['description'];
  data = json['data'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = this.success;
  data['description'] = this.description;
  data['data'] = this.data;
  return data;
  }

}