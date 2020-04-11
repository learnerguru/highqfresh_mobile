import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:highqfresh/apimanager/UserApiCalls.dart';
import 'package:highqfresh/constant/LgConstant.dart';
import 'package:highqfresh/constant/SharedPref.dart';
import 'package:highqfresh/request/AddLoginRequest.dart';
import 'package:highqfresh/response/LoginUserResponse.dart';
import 'package:highqfresh/response/UserResponse.dart';
import 'package:highqfresh/screens/landingscreen/LandingScreen.dart';
import 'package:highqfresh/utils/EncrtptDecrypt.dart';
import 'package:highqfresh/utils/FCMUtils.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(61, 58, 97, 1),
      body: setBodyContainerView(context),
    );
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
          labelText: 'UserName',
          prefixIcon: Icon(Icons.person_outline),
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

    final loginButon = MaterialButton(
      onPressed: () {
        String userName =
            _controllerUsername.text == null ? "" : _controllerUsername.text;
        String password =
            _controllerPassword.text == null ? "" : _controllerPassword.text;
        if (!LGValidationUtils.isValidString(userName) ||
            !LGValidationUtils.isValidString(password)) {
          LgSnackbarUtils.showInSnackBarAtBottom(
              "Username/Password can't be empty...", context, false);
        } else {
          getFutureBody(context);
        }

        // body:
        //  getFuture(context,EncryptDecryptHelper.EncryptDatas(_controllerUsername.text),EncryptDecryptHelper.EncryptDatas(_controllerPassword.text));
      },
      //since this is only a UI app
      child: Text(
        'SIGN IN',
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'SFUIDisplay',
          fontWeight: FontWeight.bold,
        ),
      ),
      color: Color(0xffff2d55),
      elevation: 0,
      minWidth: 400,
      height: 50,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );

    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(LgConstant.app_icon_asset_path),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter)),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 270),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(23),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Container(color: Color(0xfff5f5f5), child: userName),
                ),
                Container(color: Color(0xfff5f5f5), child: password),
                Padding(padding: EdgeInsets.only(top: 20), child: loginButon),
              ],
            ),
          ),
        )
      ],
    );
  }

  FutureBuilder<UserResponse> getFutureBody(BuildContext context) {
    return FutureBuilder<UserResponse>(
      future: UserApiCalls.loginUser(
          context,
          addLoginRequest(
              EncryptDecryptHelper.EncryptDatas(_controllerUsername.text),
              EncryptDecryptHelper.EncryptDatas(_controllerPassword.text))),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return getLoginRecentData(snapshot.data, context);
      },
    );
  }

  static getLoginRecentData(
      UserResponse userMappingResponse, BuildContext context) async {
    if (userMappingResponse == null ||
        userMappingResponse.data == null ||
        userMappingResponse.data.isEmpty ||
        userMappingResponse.data[0].user_status == LgConstant.no) {
      LgSnackbarUtils.showInSnackBarAtBottom(
          LGValidationUtils.checkString(
              (userMappingResponse.description).isEmpty
                  ? "Unable to login.Please try again later..."
                  : userMappingResponse.description),
          context,
          false);
    } else {
      LGSharedPrefernces.setServerPrefs(
          SharedPref.userData, json.encode(userMappingResponse.toJson()));
    }

    LGSharedPrefernces.getServerPrefs(SharedPref.userData)
        .then((String selServer) {
      // the code to be run once the answer has come
      print(selServer);
      if (selServer == null || selServer.isEmpty) {
        LgConstant.activeUser = null;
      } else {
        LoginUserResponse userMappingResponse11 =
            ParseHelper.parseLoginUserResponse(selServer);
        LgConstant.activeUser = userMappingResponse11.data[0];
        print(userMappingResponse11.data[0].name);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LandingScreen()),
            (Route<dynamic> route) => false);
      }
    });
  }

  AddLoginRequest addLoginRequest(String user_name, String password) {
    AddLoginRequest addLogin = new AddLoginRequest();
    addLogin.userName = user_name;
    addLogin.password = password;
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
