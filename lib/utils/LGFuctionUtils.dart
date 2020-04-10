
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highqfresh/utils/LGConnectivityChecker.dart';

class LGFuctionUtils{

 static setActionWidget(IconData iconData, Function onClickAction,BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return GestureDetector(
      child: Icon(
        iconData,
        size: 25,
        color: color,
      ),
      onTap: () {
        if (!LGConnectivityChecker.checkStatus(context)) {
          return;
        }
        onClickAction();
      },
    );
  }
}