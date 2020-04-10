
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:highqfresh/constant/LgConstant.dart';
import 'package:highqfresh/constant/SharedPref.dart';
import 'package:highqfresh/response/LoginUserResponse.dart';
import 'package:highqfresh/screens/landingscreen/LandingScreen.dart';
import 'package:highqfresh/screens/splash/SplashScreen.dart';
import 'package:highqfresh/utils/FCMUtils.dart';
import 'package:highqfresh/utils/LGDeviceInfo.dart';
import 'package:highqfresh/utils/LGSharedPrefernces.dart';
import 'package:highqfresh/utils/ParseHelper.dart';





class SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
    Timer(
        Duration(seconds: widget.seconds),
            () {
          if (new LandingScreen() is String) {
            // It's fairly safe to assume this is using the in-built material
            // named route component
            Navigator.of(context).pushReplacementNamed(widget.navigateAfterSeconds);
          } else if (widget.navigateAfterSeconds is Widget) {
            Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => widget.navigateAfterSeconds));
          } else {
            throw new ArgumentError(
                'widget.navigateAfterSeconds must either be a String or Widget'
            );
          }
        }

    );
  }


  checkLogin(){
    LGSharedPrefernces.getServerPrefs(SharedPref.userData).then((String selServer) {
      // the code to be run once the answer has come
      print(selServer);
      if(selServer==null || selServer.isEmpty){
        LgConstant.activeUser=null;
      }else{
        LoginUserResponse userMappingResponse11 = ParseHelper.parseLoginUserResponse(selServer);
        LgConstant.activeUser= userMappingResponse11.data[0];
        print(userMappingResponse11.data[0].fName);
      }

    });

    LGSharedPrefernces.getServerPrefs(SharedPref.fcmToken).then((String selServer) {
      // the code to be run once the answer has come
      print(selServer);
      if(selServer==null || selServer.isEmpty){
        FCMUtils.firebaseCloudMessaging_Listeners();
      }else{
        LgConstant.device_token = selServer;
        print(LgConstant.device_token);
      }

    });

    LGSharedPrefernces.getServerPrefs(SharedPref.deviceData).then((String selServer) {
      // the code to be run once the answer has come
      print(selServer);
      if(selServer==null || selServer.isEmpty){
        LGDeviceInfo.initPlatformState();
      }else{
        LgConstant.device_info = json.decode(selServer);
        print(LgConstant.device_info);
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new InkWell(
        onTap: widget.onClick,
        child:new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: widget.imageBackground == null
                    ? null
                    : new DecorationImage(
                  fit: BoxFit.cover,
                  image: widget.imageBackground,
                ),
                gradient: widget.gradientBackground,
                color: widget.backgroundColor,
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  flex: 2,
                  child: new Container(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: new Container(
                                child: widget.image
                            ),
                            radius: widget.photoSize,
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                          ),
                          widget.title
                        ],
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(widget.loaderColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                      ),
                      widget.loadingText
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
