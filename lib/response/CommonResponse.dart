
class CommonResponse{
  bool success;
  String description;

  CommonResponse({this.success, this.description});

  CommonResponse.fromJson(Map<String, dynamic> json) {
  success = json['success'];
  description = json['description'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = this.success;
  data['description'] = this.description;
  return data;
  }

}