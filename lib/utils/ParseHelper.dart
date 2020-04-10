

import 'dart:convert';

import 'package:highqfresh/response/CommonResponse.dart';
import 'package:highqfresh/response/GlobalSearchResponse.dart';
import 'package:highqfresh/response/HomeRecentResponse.dart';
import 'package:highqfresh/response/LoginUserResponse.dart';
import 'package:highqfresh/response/UserResponse.dart';

class ParseHelper{

  static UserResponse parseUserResponse(String responseBody) {
    print(responseBody);
    final jsonResponse = json.decode(responseBody);
    UserResponse address = new UserResponse.fromJson(jsonResponse);

    return address;
  }
  static LoginUserResponse parseLoginUserResponse(String responseBody) {
    print(responseBody);
    final jsonResponse = json.decode(responseBody);
    LoginUserResponse address = new LoginUserResponse.fromJson(jsonResponse);

    return address;
  }

  static HomeRecentResponse parseHomeRecent(String responseBody) {
    print(responseBody);
    final jsonResponse = json.decode(responseBody);
    HomeRecentResponse address = new HomeRecentResponse.fromJson(jsonResponse);

    return address;
  }



  static CommonResponse parseCommonResponse(String responseBody) {
    print(responseBody);
    final jsonResponse = json.decode(responseBody);
    CommonResponse address = new CommonResponse.fromJson(jsonResponse);

    return address;
  }



  static GlobalSearchResponse parseGlobalSearchResponse(String responseBody) {
    print(responseBody);
    final jsonResponse = json.decode(responseBody);
    GlobalSearchResponse address = new GlobalSearchResponse.fromJson(jsonResponse);

    return address;
  }

}