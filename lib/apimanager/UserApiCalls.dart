import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:highqfresh/constant/LgConstant.dart';
import 'package:highqfresh/constant/UrlConstant.dart';
import 'package:highqfresh/request/AddLoginRequest.dart';
import 'package:highqfresh/request/SendOtpRequest.dart';
import 'package:highqfresh/request/UserRegisterRequest.dart';
import 'package:highqfresh/request/VerifyOtpRequest.dart';
import 'package:highqfresh/response/CommonResponse.dart';
import 'package:highqfresh/response/UserResponse.dart';
import 'package:highqfresh/screens/loginscreen/LoginScreenState.dart';
import 'package:highqfresh/screens/register/UserRegisterState.dart';
import 'package:highqfresh/utils/LGUtils.dart';
import 'package:highqfresh/utils/ParseHelper.dart';
import 'package:http/http.dart';

class UserApiCalls {
  static Future<UserResponse> loginUser(
      BuildContext context, AddLoginRequest addLoginRequest) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    final String url = LgConstant.base_url + UrlConstant.userLogin;
    print(url);
    print(json.encode(addLoginRequest.toJson()));
    Response response = await post(url,
        headers: headers, body: json.encode(addLoginRequest.toJson()));

    print(response.body);

    // Use the compute function to run parsePhotos in a separate isolate
      return compute(ParseHelper.parseUserResponse, response.body);
  }

  static Future<CommonResponse> sendOtp(
      BuildContext context, SendOtpRequest sendOtpRequest) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    final String url = LgConstant.base_url + UrlConstant.sendOtp;
    print(url);
    print(json.encode(sendOtpRequest.toJson()));
    Response response = await post(url,
        headers: headers, body: json.encode(sendOtpRequest.toJson()));
    //CommonResponse commonResponse = ParseHelper.parseCommonResponse(response.body);
  //  UserRegisterState().sendOtpResponse(commonResponse,context);

    // Use the compute function to run parsePhotos in a separate isolate
      return compute(ParseHelper.parseCommonResponse, response.body);
  }

  static Future<CommonResponse> verifyOtp(
      BuildContext context, VerifyOtpRequest verifyOtpRequest) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    final String url = LgConstant.base_url + UrlConstant.verifyOtp;
    print(url);
    print(json.encode(verifyOtpRequest.toJson()));
    Response response = await post(url, headers: headers, body: json.encode(verifyOtpRequest.toJson()));

   // CommonResponse commonResponse = ParseHelper.parseCommonResponse(response.body);
   // UserRegisterState().verifyOtpResponse(commonResponse,context);

    // Use the compute function to run parsePhotos in a separate isolate
    return compute(ParseHelper.parseCommonResponse, response.body);
  }

  static Future<UserResponse> userRegister(
      BuildContext context, UserRegisterRequest userRegisterRequest) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    final String url = LgConstant.base_url + UrlConstant.userRegister;
    print(url);
    print(json.encode(userRegisterRequest.toJson()));
    Response response = await post(url, headers: headers, body: json.encode(userRegisterRequest.toJson()));
   //UserResponse userResponse = ParseHelper.parseUserResponse(response.body);
   // UserRegisterState().userRegisterResponse(userResponse,context);
    // Use the compute function to run parsePhotos in a separate isolate
    return compute(ParseHelper.parseUserResponse, response.body);
  }
}
