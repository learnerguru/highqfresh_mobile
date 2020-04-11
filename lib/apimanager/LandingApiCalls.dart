
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:highqfresh/constant/LgConstant.dart';
import 'package:highqfresh/constant/UrlConstant.dart';
import 'package:highqfresh/request/GlobalSearchRequest.dart';
import 'package:highqfresh/request/HomeRecentRequest.dart';
import 'package:highqfresh/response/GlobalSearchResponse.dart';
import 'package:highqfresh/response/HomeRecentResponse.dart';
import 'package:highqfresh/utils/LGUtils.dart';
import 'package:highqfresh/utils/ParseHelper.dart';
import 'package:http/http.dart';


class LandingApiCalls{


 static Future<HomeRecentResponse> getHomeRecent(BuildContext context,HomeRecentRequest homeRecentRequest) async {
  final String url = LgConstant.base_url + UrlConstant.homeRecent;
  print(url);
  print(LGUtils.getAuthHeader());
  print(json.encode(homeRecentRequest.toJson()));
  Response response = await post(url, headers: LGUtils.getAuthHeader(), body: json.encode(homeRecentRequest.toJson()));
  if(!LGUtils.checkResponse(response,context)){
   LGUtils.onLogout(context);
  }else{
   // Use the compute function to run parsePhotos in a separate isolate
   return compute(ParseHelper.parseHomeRecent, response.body);
  }


 }

 static Future<GlobalSearchResponse> getGlobalSearchResponse(BuildContext context,GlobalSearchRequest globalSearchRequest ) async {
  final String url = LgConstant.base_url + UrlConstant.globalSearch;
  print(url);
  print(LGUtils.getAuthHeader());
  print(json.encode(globalSearchRequest.toJson()));
  Response response = await post(url, headers: LGUtils.getAuthHeader(), body: json.encode(globalSearchRequest.toJson()));
  print(response);
  return compute(ParseHelper.parseGlobalSearchResponse, response.body);
 }


}