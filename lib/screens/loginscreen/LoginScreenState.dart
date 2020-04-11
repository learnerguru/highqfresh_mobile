import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:highqfresh/apimanager/UserApiCalls.dart';
import 'package:highqfresh/constant/LgConstant.dart';
import 'package:highqfresh/constant/SharedPref.dart';
import 'package:highqfresh/melabs/MEButton.dart';
import 'package:highqfresh/request/AddLoginRequest.dart';
import 'package:highqfresh/response/LoginUserResponse.dart';
import 'package:highqfresh/response/UserResponse.dart';
import 'package:highqfresh/screens/landingscreen/LandingScreen.dart';
import 'package:highqfresh/screens/register/UserRegisterPage.dart';
import 'package:highqfresh/strings/PageName.dart';
import 'package:highqfresh/utils/EncrtptDecrypt.dart';
import 'package:highqfresh/utils/FCMUtils.dart';
import 'package:highqfresh/utils/LGConnectivityChecker.dart';
import 'package:highqfresh/utils/LGDeviceInfo.dart';
import 'package:highqfresh/utils/LGSharedPrefernces.dart';
import 'package:highqfresh/utils/LGValidationUtils.dart';
import 'package:highqfresh/utils/LgSnackbarUtils.dart';
import 'package:highqfresh/utils/ParseHelper.dart';

import 'LoginScreen.dart';

class LoginScreenState extends State<LoginScreen> {
  TextEditingController _controllerUsername = new TextEditingController();
  TextEditingController _controllerPassword = new TextEditingController();

  bool passwordVisible = true;
  bool isButtonClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: setBodyContainerView(context),
      bottomNavigationBar:setRegisterView() ,
    );
  }

  setRegisterView(){
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserRegisterPage(
            ),
          ),
        );
      },
      child:Container(
        height: 70,
      child: Center(child: Text("Register",style: TextStyle(color: LgConstant.app_color,fontSize: 20),),),
    ) ,);
  }


  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  checkLogin() {
    LGSharedPrefernces.getServerPrefs(SharedPref.fcmToken)
        .then((String selServer) {
      // the code to be run once the answer has come
      print(selServer);
      if (selServer == null || selServer.isEmpty) {
        FCMUtils.firebaseCloudMessaging_Listeners();
      } else {
        LgConstant.device_token = selServer;
        print(LgConstant.device_token);
      }
    });

    LGSharedPrefernces.getServerPrefs(SharedPref.deviceData)
        .then((String selServer) {
      // the code to be run once the answer has come
      print(selServer);
      if (selServer == null || selServer.isEmpty) {
        LGDeviceInfo.initPlatformState();
      } else {
        LgConstant.device_info = json.decode(selServer);
        print(LgConstant.device_info);
      }
    });
  }

  setBodyContainerView(BuildContext context) {
    final userName = TextFormField(
      controller: _controllerUsername,
      obscureText: false,
      style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: PageName.mobile_number,
          prefixIcon: Icon(Icons.phone_android),
          labelStyle: TextStyle(fontSize: 15)),
    );

    final password = TextFormField(
      keyboardType: TextInputType.text,
      controller: _controllerPassword,
      obscureText: passwordVisible, //This will obscure text dynamically
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
        hintText: 'Enter your password',
        // Here is key idea
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            passwordVisible ? Icons.visibility_off : Icons.visibility,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
        ),
      ),
    );

    var column = ListView(

      children: <Widget>[
        userName,SizedBox(height: 10,),password,
        SizedBox(height: 10,),
        Column(children: <Widget>[ buttonView()],)
      ],
    );
    var cardView = Card(

      child: Container(
        margin: EdgeInsets.all(20),
        child: column,
      ),
    );

    var container= Container(
      margin: EdgeInsets.all(20),
      height: 335,
      child: cardView,
    );
    return Container(
      height: MediaQuery.of(context).size.height,

      child: Center(child:container ,),
      color: Colors.black12,
    );

  }

  buttonView(){
    return !isButtonClicked? GestureDetector(
      onTap: () {
        String userName =
        _controllerUsername.text == null ? "" : _controllerUsername.text;
        String password =
        _controllerPassword.text == null ? "" : _controllerPassword.text;
        if (!LGValidationUtils.isValidString(userName) ||
            !LGValidationUtils.isValidString(password)) {
          LgSnackbarUtils.showInSnackBarAtBottom(
              "Username/Password can't be empty...", context, false);
          return;
        }
        setState(() {
          isButtonClicked=true;
        });

        UserApiCalls.loginUser(
            context,
            addLoginRequest()).then((UserResponse userResponse){
          loginResponse(userResponse,context);
        });


        // body:
        //  getFuture(context,EncryptDecryptHelper.EncryptDatas(_controllerUsername.text),EncryptDecryptHelper.EncryptDatas(_controllerPassword.text));
      },
      child: MEButton.primaryButton("Login",100),
    ):SizedBox(height:30,width:30,child: CircularProgressIndicator(),) ;
  }



   loginResponse(
      UserResponse userResponse, BuildContext context) async {
    setState(() {
      isButtonClicked=false;
    });
    if (userResponse == null ||
        userResponse.data == null ||
        userResponse.data.isEmpty ||
        userResponse.data[0].user_status == LgConstant.no) {
      LgSnackbarUtils.showInSnackBarAtBottom(
          LGValidationUtils.checkString(
              (userResponse.description).isEmpty
                  ? "Unable to login.Please try again later..."
                  : userResponse.description),
          context,
          false);
    } else {
      LGSharedPrefernces.setServerPrefs(
          SharedPref.userData, json.encode(userResponse.toJson()));
    }

    LGSharedPrefernces.getServerPrefs(SharedPref.userData)
        .then((String selServer) {
      // the code to be run once the answer has come
      print(selServer);
      if (selServer == null || selServer.isEmpty) {
        LgConstant.activeUser = null;
      } else {
        LoginUserResponse loginUserResponse =
            ParseHelper.parseLoginUserResponse(selServer);
        LgConstant.activeUser = loginUserResponse.data[0];
        print(loginUserResponse.data[0].name);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LandingScreen()),
            (Route<dynamic> route) => false);
      }
    });
  }

  AddLoginRequest addLoginRequest() {
    AddLoginRequest addLogin = new AddLoginRequest();
    addLogin.userName = _controllerUsername.text;
    addLogin.password = _controllerPassword.text;
    addLogin.deviceToken = LgConstant.device_token;
    addLogin.deviceUuid = Platform.isAndroid
        ? LgConstant.device_info["androidId"].toString()
        : Platform.isIOS ? LgConstant.device_info["androidId"].toString() : "";
    addLogin.deviceVersion = Platform.isAndroid
        ? LgConstant.device_info["version.sdkInt"].toString()
        : Platform.isIOS
            ? LgConstant.device_info["version.sdkInt"].toString()
            : "";
    addLogin.deviceName = Platform.isAndroid
        ? LgConstant.device_info["device"]
        : Platform.isIOS ? LgConstant.device_info["device"] : "";
    addLogin.deviceModel = Platform.isAndroid
        ? (LgConstant.device_info["brand"] +
            " " +
            LgConstant.device_info["model"])
        : Platform.isIOS
            ? (LgConstant.device_info["brand"] +
                " " +
                LgConstant.device_info["model"])
            : "";
    addLogin.devicePlatform =
        Platform.isAndroid ? "ANDROID" : Platform.isAndroid ? "IOS" : "";
    print(json.encode(addLogin));
    return addLogin;
  }
}
