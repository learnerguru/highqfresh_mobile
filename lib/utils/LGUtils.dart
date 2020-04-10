
import 'package:flutter/material.dart';
import 'package:highqfresh/constant/LgConstant.dart';
import 'package:highqfresh/constant/SharedPref.dart';
import 'package:highqfresh/screens/landingscreen/LandingScreen.dart';
import 'package:http/http.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'FCMUtils.dart';
import 'LGSharedPrefernces.dart';

class LGUtils{


  static Map<String, String> getAuthHeader() {
    String authorization="";
    String platform="";
    if(LgConstant.activeUser!=null){
      authorization=LgConstant.activeUser.androidAuthenticationCode;
      platform="ANDROID";
    }
    Map<String, String> headers = {"Content-type": "application/json","Authorization": authorization,"platform": platform,};
    return headers;
  }

  static bool checkResponse(Response response){
    if(response.statusCode==401){
      return false;
    }
    return true;
  }

  static onLogout(BuildContext context){
    print("LOGOUT");
    LGSharedPrefernces.setServerPrefs(SharedPref.userData, "");
    LgConstant.activeUser=null;
    LGSharedPrefernces.setServerPrefs(SharedPref.fcmToken, "");
    LgConstant.device_token=null;
    FCMUtils.deleteToken();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        LandingScreen()), (Route<dynamic> route) => false);
  }

  static launchMap({String lat , String long }) async{
    var mapSchema = 'geo:$lat,$long';
    if (await canLaunch(mapSchema)) {
      await launch(mapSchema);
    } else {
      throw 'Could not launch $mapSchema';
    }
  }
  static launchURL(String url) async {
    print("launchURL===>"+url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

   static removeWhiteSpace(String data){
    var url=data.replaceAll(new RegExp(r"\s+\b|\b\s"),"");
    print(" remvoe space=="+url);
    return url;
   }

    static shareImage(url,textmsg)
    {
      return Share.share(url+" . Download application at  "+LgConstant.play_store_url, subject: textmsg);
    }

}