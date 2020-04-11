import 'package:flutter/material.dart';
import 'package:highqfresh/constant/LgConstant.dart';
import 'package:highqfresh/screens/loginscreen/LoginScreen.dart';
import 'package:highqfresh/utils/LGUtils.dart';

import 'ProfilePage.dart';

class ProfileState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: setBody(),
      bottomNavigationBar: BottomAppBar(
        child: Text(LgConstant.packageInfo == null ? "" : LgConstant.packageInfo.version,textAlign: TextAlign.center,),
      ),
    );
  }

  setBody(){
    return SingleChildScrollView(
      child: Container(

        child: new Column(
          children: <Widget>[
            SizedBox(height: 20.0),
         getImage(),
            getText(),
            SizedBox(height: 20.0),
          Center(
             child: setButton(),
          ),

            // DiaryHomeList.setDiaryData(diaryResponse.data,context,PageName.no_diary_found)
          ],
        ),
      ),
    );

  }


  getImage(){
    if(LgConstant.activeUser==null || LgConstant.activeUser.id==0){
      return   FadeInImage(
          image: AssetImage(LgConstant.app_icon_asset_path),
          placeholder: AssetImage(LgConstant.app_icon_asset_path),
          fit: BoxFit.fill,
          height: 92);
    }
    return   FadeInImage(
        image: NetworkImage(LgConstant.activeUser.profile_image),
        placeholder: AssetImage(LgConstant.app_icon_asset_path),
        fit: BoxFit.fill,
        height: 92);
  }

  getText(){
    if(LgConstant.activeUser==null || LgConstant.activeUser.id==0){
      return  Container();
    }
    return   Text(LgConstant.activeUser.name,style: TextStyle(fontSize: 18,color: Colors.brown),);
  }

  setButton(){
    if(widget.isLogin){
      return FloatingActionButton.extended(
        label: Text("LOGOUT"),
        onPressed: (){
          LGUtils.onLogout(context);
        },
        heroTag: UniqueKey(),
        icon: Icon(Icons.vpn_key),
      );
    }else{
      return FloatingActionButton.extended(
        label: Text("LOGIN"),
        onPressed: (){
          print("LOGIN");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        },
        heroTag: UniqueKey(),
        icon: Icon(Icons.vpn_key),
      );
    }
  }
}
