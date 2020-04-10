import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LgSnackbarUtils{


  static void showInSnackBarAndFinishPageAtBottom(String value,BuildContext context,bool isSucess) {
    Color color = isSucess?Colors.green:Colors.red;
    IconData icon = isSucess?Icons.beenhere:Icons.cancel;
    Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      message:value,
      icon: Icon(
        icon,
        size: 28.0,
        color: Colors.white,
      ),
      backgroundColor: color,
      duration: Duration(seconds: 1),

    )..show(context).then((r)=> Navigator.canPop(context)? Navigator.pop(context,true): SystemNavigator.pop());
  }


  static void showInSnackBarAtBottom(String value,BuildContext context,bool isSucess) {
    Color color = isSucess?Colors.green:Colors.red;
    IconData icon = isSucess?Icons.beenhere:Icons.cancel;
    Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      message:value,
      icon: Icon(
        icon,
        size: 28.0,
        color: Colors.white,
      ),
      backgroundColor: color,
      duration: Duration(seconds: 1),

    )..show(context);
  }

}