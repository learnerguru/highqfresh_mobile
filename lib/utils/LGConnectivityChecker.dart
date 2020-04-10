

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class LGConnectivityChecker {
  static Connectivity connectivity = new Connectivity();
  static StreamSubscription<ConnectivityResult> subscription;
  static ConnectivityResult connectivityResult;

  static bool checkStatus(BuildContext context) {
    subscription = connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      connectivityResult = result;
    });
    if(connectivityResult==null){
      print("BAD OR GOOD");
      return true;
    }
    if (connectivityResult == ConnectivityResult.none) {
      print("BAD");
      showNetworkDialog(context);
      return false;
    }
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      print("GOOD");
      return true;
    }

  }

  static void disposeStreams(){
    subscription.cancel();

  }

 static Future<bool>  showNetworkDialog(BuildContext context){
    return showDialog(context: context,
        builder: (context)=>AlertDialog(
          title: Text("Network not available.Please check connection"),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: (){
                Navigator.pop(context,false);
              },
            ),
          ],
        )
    );
  }
}
