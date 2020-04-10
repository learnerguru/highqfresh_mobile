import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:highqfresh/constant/LgConstant.dart';
import 'package:highqfresh/constant/UrlConstant.dart';
import 'package:highqfresh/request/AddLoginRequest.dart';
import 'package:highqfresh/response/UserResponse.dart';
import 'package:highqfresh/screens/loginscreen/LoginScreenState.dart';
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
    UserResponse userMappingResponse = null;
    if (response.statusCode == 200) {
      userMappingResponse = ParseHelper.parseUserResponse(response.body);
    }
    LoginScreenState.getLoginRecentData(userMappingResponse, context);

    print(response.body);

    // Use the compute function to run parsePhotos in a separate isolate
    //  return compute(ParseHelper.parseUserMappingResponse, response.body);
  }

  static Future<UserResponse> getUserCategory(
      BuildContext context, int usercategory, int parishid) async {
    final String url = LgConstant.base_url +
        UrlConstant.getUsersByCategory
            .replaceAll("{usercategory}", usercategory.toString())
            .replaceAll("{parishid}", parishid.toString());
    Response response = await get(url, headers: LGUtils.getAuthHeader());
    print(response.body);
    // Use the compute function to run parsePhotos in a separate isolate
    return compute(ParseHelper.parseUserResponse, response.body);
  }
}
