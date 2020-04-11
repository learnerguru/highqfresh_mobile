import 'package:flutter/material.dart';
import 'package:highqfresh/constant/LgConstant.dart';

class MEButton{

  static gradientButton(String text,BuildContext context){
   return Container(
      height: 45,
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              LgConstant.app_color,
              LgConstant.app_secondary_color
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Center(
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  static primaryButton(String text,double width){
    return Container(
      height: 45,
      margin: EdgeInsets.only(top: 10),
      width: width,
      decoration: BoxDecoration(
          color: LgConstant.app_color,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Center(
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }


  static chipButtonWithIcon(String text,IconData iconData,Color color){
    return Chip(
      backgroundColor: color,
      avatar: Icon(
        iconData,
        color: Colors.white,
      ),
      label: Text(text,
        style: TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }

  static iconAndTextVertical(String text,IconData iconData,BuildContext context){
    return Container(
      height: 80,
      width: 80,
      child: Center(child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(iconData,color: LgConstant.app_color,size: 35,),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(text,textAlign:TextAlign.center,style: TextStyle(color: LgConstant.app_color,fontSize: 12,fontWeight: FontWeight.bold,),),
          ),
        ],
      ),),);


  }
}