import 'package:flutter/material.dart';

import 'HomePageCardRow.dart';

class HomePageCard extends StatelessWidget {

  String imageName;
  String title;
  String subTitle;
  int parishCount;
  Function onClickAction;

  HomePageCard (String imageName, String title, String subTitle, int parishCount, Function onClickAction) {
    this.imageName      = imageName;
    this.title          = title;
    this.subTitle       = subTitle;
    this.parishCount    = parishCount;
    this.onClickAction  = onClickAction;
  }
    @override
    Widget build(BuildContext context) {
     return new HomePageCardRow(this.imageName, this.title, this.subTitle, this.parishCount, this.onClickAction);
    }
  }