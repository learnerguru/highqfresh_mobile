class HomeRecentRequest {
  int userId;
  String androidVersion;
  String iosVersion;

  HomeRecentRequest(
      {
        this.userId,
        this.androidVersion,
        this.iosVersion});

  HomeRecentRequest.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    androidVersion = json['android_version'];
    iosVersion = json['ios_version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['android_version'] = this.androidVersion;
    data['ios_version'] = this.iosVersion;
    return data;
  }
}