import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:highqfresh/apimanager/UserApiCalls.dart';
import 'package:highqfresh/constant/LgConstant.dart';
import 'package:highqfresh/constant/SharedPref.dart';
import 'package:highqfresh/melabs/MEButton.dart';
import 'package:highqfresh/request/SendOtpRequest.dart';
import 'package:highqfresh/request/UserRegisterRequest.dart';
import 'package:highqfresh/request/VerifyOtpRequest.dart';
import 'package:highqfresh/response/CommonResponse.dart';
import 'package:highqfresh/response/LoginUserResponse.dart';
import 'package:highqfresh/response/UserResponse.dart';
import 'package:highqfresh/screens/landingscreen/LandingScreen.dart';
import 'package:highqfresh/screens/loginscreen/LoginScreen.dart';
import 'package:highqfresh/screens/register/UserRegisterPage.dart';
import 'package:highqfresh/strings/PageName.dart';
import 'package:highqfresh/utils/LGSharedPrefernces.dart';
import 'package:highqfresh/utils/LGUtils.dart';
import 'package:highqfresh/utils/LGValidationUtils.dart';
import 'package:highqfresh/utils/LgSnackbarUtils.dart';
import 'package:highqfresh/utils/ParseHelper.dart';

class UserRegisterState extends State<UserRegisterPage> {
  static TextEditingController mobileNumberOtpController =
      new TextEditingController();
  static TextEditingController otpController = new TextEditingController();
  static TextEditingController nameController = new TextEditingController();
  static TextEditingController mobileNumberContoller =
      new TextEditingController();
  static TextEditingController passwordController = new TextEditingController();
  static TextEditingController confirmPasswordController =
      new TextEditingController();
  static TextEditingController addressController = new TextEditingController();
  static TextEditingController emailIdController = new TextEditingController();
  int showValue = 0;
  bool passwordVisible = true;
  bool confirmPasswordVisible = true;
  bool isSendButtonClicked = false;
  bool isVerifyButtonClicked = false;
  bool isRegisterButtonClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: setBody(),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      passwordVisible = true;
      confirmPasswordVisible = true;
      isSendButtonClicked = false;
      isVerifyButtonClicked = false;
      isRegisterButtonClicked = false;
    });
  }

  setBody() {
    var cardView = Card(
      child: Container(
        margin: EdgeInsets.all(20),
        child: showValue == 0
            ? sendOtpView()
            : showValue == 1
                ? verifyOtpView()
                : showValue == 2 ? userRegisterView() : Container(),
      ),
    );

    var container = Container(
      margin: EdgeInsets.all(20),
      child: cardView,
    );

    var scrollview = SingleChildScrollView(
      child: container,
    );
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: scrollview,
      ),
      color: Colors.black12,
    );
  }

  sendOtpView() {
    var mobileNoOtp = TextFormField(
      controller: mobileNumberOtpController,
      keyboardType: TextInputType.number,
      maxLength: 10,
      obscureText: false,
      style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: PageName.mobile_number,
          prefixIcon: Icon(Icons.person),
          labelStyle: TextStyle(fontSize: 15)),
    );

    var sendOtpButton = !isSendButtonClicked
        ? GestureDetector(
            onTap: () {
              String userName = mobileNumberOtpController.text == null
                  ? ""
                  : mobileNumberOtpController.text;

              if (!LGValidationUtils.isValidString(userName)) {
                LgSnackbarUtils.showInSnackBarAtBottom(
                    "Mobile Number can't be empty...", context, false);
                return;
              }
              setState(() {
                isSendButtonClicked = true;
              });

              UserApiCalls.sendOtp(context, sendOtpRequest())
                  .then((CommonResponse commonResponse) {
                sendOtpResponse(commonResponse, context);
              });

              // body:
              //  getFuture(context,EncryptDecryptHelper.EncryptDatas(_controllerUsername.text),EncryptDecryptHelper.EncryptDatas(_controllerPassword.text));
            },
            child: MEButton.primaryButton("Send OTP", 100),
          )
        : SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(),
          );

    var column = Column(children: <Widget>[
      mobileNoOtp,
      Column(
        children: <Widget>[sendOtpButton],
      )
    ]);

    var padding = Padding(
      padding: EdgeInsets.all(10),
      child: column,
    );

    var card = Card(
      child: padding,
      color: Colors.white,
    );

    var center = Center(
      child: card,
    );
    return Container(
      child: center,
    );
  }

  sendOtpRequest() {
    SendOtpRequest sendOtpRequest = new SendOtpRequest();
    sendOtpRequest.mobile_no = mobileNumberOtpController.text;
    return sendOtpRequest;
  }

  sendOtpResponse(CommonResponse commonResponse, BuildContext context) {
    setState(() {
      isSendButtonClicked = false;
    });
    if (commonResponse == null || !commonResponse.success) {
      LgSnackbarUtils.showInSnackBarAtBottom(
          LGValidationUtils.checkString((commonResponse.description).isEmpty
              ? PageName.unable_to_continue
              : commonResponse.description),
          context,
          false);
      return;
      // return sendOtpView();
    }
    setState(() {
      showValue = 1;
    });
    LgSnackbarUtils.showInSnackBarAtBottom(
        "Otp Sucessfully Send", context, true);
    // return verifyOtpView();
  }

  verifyOtpView() {
    var otpValue = TextFormField(
      controller: otpController,
      keyboardType: TextInputType.number,
      maxLength: 6,
      obscureText: false,
      style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "OTP",
          prefixIcon: Icon(Icons.security),
          labelStyle: TextStyle(fontSize: 15)),
    );

    var verifyOtpButton = !isVerifyButtonClicked
        ? GestureDetector(
            onTap: () {
              String userName =
                  otpController.text == null ? "" : otpController.text;

              if (!LGValidationUtils.isValidString(userName)) {
                LgSnackbarUtils.showInSnackBarAtBottom(
                    "OTP can't be empty...", context, false);
                return;
              }
              setState(() {
                isVerifyButtonClicked = true;
              });

              UserApiCalls.verifyOtp(context, verifyOtpRequest())
                  .then((CommonResponse commonResponse) {
                verifyOtpResponse(commonResponse, context);
              });
              // body:
              //  getFuture(context,EncryptDecryptHelper.EncryptDatas(_controllerUsername.text),EncryptDecryptHelper.EncryptDatas(_controllerPassword.text));
            },
            child: MEButton.primaryButton("Verify OTP", 100),
          )
        : SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(),
          );

    var column = Column(children: <Widget>[otpValue, verifyOtpButton]);

    var padding = Padding(
      padding: EdgeInsets.all(10),
      child: column,
    );

    var card = Card(
      child: padding,
      color: Colors.white,
    );

    var center = Center(
      child: card,
    );
    return Container(
      child: center,
    );
  }

  verifyOtpRequest() {
    VerifyOtpRequest sendOtpRequest = new VerifyOtpRequest();
    sendOtpRequest.mobile_no = mobileNumberOtpController.text;
    sendOtpRequest.otp = otpController.text;
    return sendOtpRequest;
  }

  verifyOtpResponse(CommonResponse commonResponse, BuildContext context) {
    setState(() {
      isVerifyButtonClicked = false;
    });
    if (commonResponse == null || !commonResponse.success) {
      LgSnackbarUtils.showInSnackBarAtBottom(
          LGValidationUtils.checkString((commonResponse.description).isEmpty
              ? PageName.unable_to_continue
              : commonResponse.description),
          context,
          false);
      return;
    }
    setState(() {
      showValue = 2;
    });

    LgSnackbarUtils.showInSnackBarAtBottom(
        "Otp Verified Sucessfully", context, true);
  }

  userRegisterView() {
    var nameValue = TextFormField(
      controller: nameController,
      keyboardType: TextInputType.text,
      maxLength: 20,
      obscureText: false,
      style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Name",
          prefixIcon: Icon(Icons.person),
          labelStyle: TextStyle(fontSize: 15)),
    );

    mobileNumberContoller.text = mobileNumberOtpController.text;
    var mobileNUmber = TextFormField(
      controller: mobileNumberContoller,
      keyboardType: TextInputType.number,
      maxLength: 10,
      enabled: false,
      obscureText: false,
      style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: PageName.mobile_number,
          prefixIcon: Icon(Icons.person),
          labelStyle: TextStyle(fontSize: 15)),
    );

    var emailId = TextFormField(
      controller: emailIdController,
      keyboardType: TextInputType.emailAddress,
      maxLength: 20,
      obscureText: false,
      style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Email ID",
          prefixIcon: Icon(Icons.person),
          labelStyle: TextStyle(fontSize: 15)),
    );

    var address = TextFormField(
      controller: addressController,
      keyboardType: TextInputType.text,
      maxLength: 50,
      obscureText: false,
      style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Address",
          prefixIcon: Icon(Icons.person),
          labelStyle: TextStyle(fontSize: 15)),
    );

    final password = TextFormField(
      keyboardType: TextInputType.text,
      controller: passwordController,
      maxLength: 20,
      obscureText: passwordVisible, //This will obscure text dynamically
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
        hintText: 'Enter your password',
        labelStyle: TextStyle(fontSize: 15),
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
    final confirmPassword = TextFormField(
      keyboardType: TextInputType.text,
      maxLength: 20,
      controller: confirmPasswordController,
      obscureText: confirmPasswordVisible, //This will obscure text dynamically
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Confirm Password',
        hintText: 'Enter your password',
        labelStyle: TextStyle(fontSize: 15),
        // Here is key idea
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            confirmPasswordVisible ? Icons.visibility_off : Icons.visibility,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              confirmPasswordVisible = !confirmPasswordVisible;
            });
          },
        ),
      ),
    );

    var registerButton = !isRegisterButtonClicked
        ? GestureDetector(
            onTap: () {
              if(!checkRegisterValidation()){
                return;
              }
              setState(() {
                isRegisterButtonClicked = true;
              });

              UserApiCalls.userRegister(context, userRegisterRequest())
                  .then((UserResponse userResponse) {
                userRegisterResponse(userResponse, context);
              });

              // body:
              //  getFuture(context,EncryptDecryptHelper.EncryptDatas(_controllerUsername.text),EncryptDecryptHelper.EncryptDatas(_controllerPassword.text));
            },
            child: MEButton.primaryButton("Register", 100),
          )
        : SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(),
          );

    var column = Column(children: <Widget>[
      nameValue,
      mobileNUmber,
      emailId,
      address,
      password,
      confirmPassword,
      registerButton
    ]);

    var padding = Padding(
      padding: EdgeInsets.all(10),
      child: column,
    );

    var card = Card(
      child: padding,
      color: Colors.white,
    );

    var center = Center(
      child: card,
    );
    return Container(
      child: center,
    );
  }

  checkRegisterValidation(){
    if(!LGValidationUtils.isValidString(nameController.text)){
      LgSnackbarUtils.showInSnackBarAtBottom("Enter Valid Name", context, false);
      return false;
    }
    if(!LGValidationUtils.isValidString(addressController.text)){
      LgSnackbarUtils.showInSnackBarAtBottom("Enter Valid Address", context, false);
      return false;
    }
    if(!LGValidationUtils.isValidString(passwordController.text)){
      LgSnackbarUtils.showInSnackBarAtBottom("Enter Valid Password", context, false);
      return false;
    }
    if(!LGValidationUtils.isValidString(confirmPasswordController.text)){
      LgSnackbarUtils.showInSnackBarAtBottom("Enter Confirm Password", context, false);
      return false;
    }
    if(passwordController.text!=confirmPasswordController.text){
      LgSnackbarUtils.showInSnackBarAtBottom("Password Mismatch", context, false);
      return false;
    }
    return true;
  }

  userRegisterRequest() {
    UserRegisterRequest sendOtpRequest = new UserRegisterRequest();
    sendOtpRequest.mobile_no = mobileNumberContoller.text;
    sendOtpRequest.user_name = mobileNumberContoller.text;
    sendOtpRequest.name = nameController.text;
    sendOtpRequest.password = passwordController.text;
    sendOtpRequest.email_id = emailIdController.text;
    sendOtpRequest.address = addressController.text;
    sendOtpRequest.deviceToken = LgConstant.device_token;
    sendOtpRequest.deviceUuid = Platform.isAndroid
        ? LgConstant.device_info["androidId"].toString()
        : Platform.isIOS ? LgConstant.device_info["androidId"].toString() : "";
    sendOtpRequest.deviceVersion = Platform.isAndroid
        ? LgConstant.device_info["version.sdkInt"].toString()
        : Platform.isIOS
            ? LgConstant.device_info["version.sdkInt"].toString()
            : "";
    sendOtpRequest.deviceName = Platform.isAndroid
        ? LgConstant.device_info["device"]
        : Platform.isIOS ? LgConstant.device_info["device"] : "";
    sendOtpRequest.deviceModel = Platform.isAndroid
        ? (LgConstant.device_info["brand"] +
            " " +
            LgConstant.device_info["model"])
        : Platform.isIOS
            ? (LgConstant.device_info["brand"] +
                " " +
                LgConstant.device_info["model"])
            : "";
    sendOtpRequest.devicePlatform =
        Platform.isAndroid ? "ANDROID" : Platform.isAndroid ? "IOS" : "";
    print(json.encode(sendOtpRequest));
    return sendOtpRequest;
  }

  userRegisterResponse(UserResponse userResponse, BuildContext context) {
    setState(() {
      isRegisterButtonClicked = false;
    });
    if (userResponse == null ||
        userResponse.data == null ||
        userResponse.data.isEmpty ||
        userResponse.data[0].user_status == LgConstant.no) {
      LgSnackbarUtils.showInSnackBarAtBottom(
          LGValidationUtils.checkString((userResponse.description).isEmpty
              ? "Unable to Register.Please try again later..."
              : userResponse.description),
          context,
          false);
      return;
    }

    LGSharedPrefernces.setServerPrefs(
        SharedPref.userData, json.encode(userResponse.toJson()));

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
}
