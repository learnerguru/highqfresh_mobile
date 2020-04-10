import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:highqfresh/constant/SharedPref.dart';
import 'package:highqfresh/utils/LGSharedPrefernces.dart';

class FCMUtils{
 static FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

 static void deleteToken(){
   _firebaseMessaging.deleteInstanceID();
   firebaseCloudMessaging_Listeners();
 } 

 static void firebaseCloudMessaging_Listeners() {
    if (Platform.isIOS) iOS_Permission();

    _firebaseMessaging.getToken().then((token){
      print(token);
      LGSharedPrefernces.setServerPrefs(SharedPref.fcmToken, token);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

 static void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true)
    );
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings)
    {
      print("Settings registered: $settings");
    });
  }
}