import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:highqfresh/constant/LgConstant.dart';
import 'package:highqfresh/constant/SharedPref.dart';
import 'package:highqfresh/screens/profile/ProfilePage.dart';
import 'package:highqfresh/strings/PageName.dart';
import 'package:highqfresh/utils/LGSharedPrefernces.dart';
import 'package:highqfresh/utils/ParseHelper.dart';

import '../../apimanager/LandingApiCalls.dart';
import '../../melabs/UserCard.dart';
import '../../request/HomeRecentRequest.dart';
import '../../response/HomeRecentData.dart';
import '../../response/HomeRecentResponse.dart';
import '../../response/LoginUserResponse.dart';
import '../../utils/LGPackageUtils.dart';
import '../../utils/LGUtils.dart';
import 'LandingScreen.dart' show LandingScreen;

class LandingScreenState extends State<LandingScreen>  with SingleTickerProviderStateMixin, WidgetsBindingObserver {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: getHomeFuture(context));
  }

  @override
  initState() {
    super.initState();
    LGPackageUtils.getPackageInfo();
    WidgetsBinding.instance.addObserver(this);
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  HomeRecentRequest getHomeRecentRequest() {
    HomeRecentRequest homeRecentRequest = new HomeRecentRequest();
    homeRecentRequest.userId =
    LgConstant.activeUser == null ? 0 : LgConstant.activeUser.id;
    homeRecentRequest.androidVersion =
    LgConstant.packageInfo == null ? "" : LgConstant.packageInfo.version;
    return homeRecentRequest;
  }

  FutureBuilder<HomeRecentResponse> getHomeFuture(BuildContext context) {
    return FutureBuilder<HomeRecentResponse>(
        future: LandingApiCalls.getHomeRecent(context, getHomeRecentRequest()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? getHomeRecentData(snapshot.data, context)
              : Center(child: CircularProgressIndicator());
        });
  }

  getHomeRecentData(
      HomeRecentResponse homeRecentResponse, BuildContext context) {

    return Center(
      child: new Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            setAppUpdate(homeRecentResponse.data),
          ],
        ),
      ),
    );
  }

  static setAppUpdate(HomeRecentData homeRecentData) {
    if ((homeRecentData.isAndroidUpdateAvailable == 1 && Platform.isAndroid) ||
        (homeRecentData.isIosUpdateAvailable == 1 && Platform.isIOS)) {
      var card = UserCard(
        title: PageName.new_update_available,
        subtitle: PageName.click_here_to_update,
        imageUrl:
        "https://learnerguru.com/cdn/play_store_icon.png",
      );
      return GestureDetector(
          onTap: () {
            if (Platform.isAndroid) {
              LGUtils.launchURL(LgConstant.play_store_url);
            } else if (Platform.isIOS) {
              LGUtils.launchURL(LgConstant.app_store_url);
            }
          },
          child: card);
    } else {
      return Container();
    }
  }



  navigateToLogin() {
    bool isLogin = false;

    LGSharedPrefernces.getServerPrefs(SharedPref.userData)
        .then((String selServer) {
      // the code to be run once the answer has come
      print(selServer);
      if (selServer == null || selServer.isEmpty) {
        LgConstant.activeUser = null;
        isLogin = false;
      } else {
        LoginUserResponse userMappingResponse11 =
        ParseHelper.parseLoginUserResponse(selServer);
        LgConstant.activeUser = userMappingResponse11.data[0];
        print(userMappingResponse11.data[0].name);
        isLogin = true;
      }
    });
    print(LgConstant.activeUser);
    print("LgConstant.activeUser");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(
          isLogin: isLogin,
        ),
      ),
    );
  }
}



