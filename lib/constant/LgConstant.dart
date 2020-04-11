
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import '../response/common/LoginUser.dart';

class LgConstant{


  static int institute_id=1;
  static int yes=1;
  static int no=0;
  static MaterialColor app_color=Colors.indigo;
  static MaterialColor app_secondary_color=Colors.grey;
  static String base_url='http://eventova.com/highqfresh/';
  static String app_name='High Q';
  static String app_icon_asset_path='assets/images/app_icon.png';
  static String AES_ENCRYPT_KEY="HIGHQFRESH123456";
  static LoginUser activeUser ;
  static String play_store_url="http://bit.ly/malankaraplus";
  static String app_store_url="http://bit.ly/malankaraplus";

  static PackageInfo packageInfo =null;
  static String device_token =null;
  static Map<String, dynamic> device_info =null;


}