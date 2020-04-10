
import 'common/User.dart';

class HomeRecentData {
  List<User> userDetails;
  int isAndroidUpdateAvailable;
  int isIosUpdateAvailable;

  HomeRecentData({
    this.userDetails,
    this.isAndroidUpdateAvailable,
    this.isIosUpdateAvailable,});

  HomeRecentData.fromJson(Map<String, dynamic> json) {

    if (json['user_details'] != null) {
      userDetails = new List<User>();
      json['user_details'].forEach((v) {
        userDetails.add(new User.fromJson(v));
      });
    }
    isAndroidUpdateAvailable = json['is_android_update_available'];
    isIosUpdateAvailable = json['is_ios_update_available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.userDetails != null) {
      data['user_details'] = this.userDetails.map((v) => v.toJson()).toList();
    }
    data['is_android_update_available'] = this.isAndroidUpdateAvailable;
    data['is_ios_update_available'] = this.isIosUpdateAvailable;
    return data;
  }
}