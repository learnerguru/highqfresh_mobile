
class LoginUser {
  int id;
  int addedBy;
  String address;
  String appVersion;
  String birthDate;
  String dateCreated;
  String dateModified;
  String emailId;
  int emailVerifiedStatus;
  String fName;
  String gender;
  int instituteId;
  String lName;
  int latitude;
  int latitudeRad;
  String location;
  int longitude;
  int longitudeRad;
  int maritalStatus;
  String password;
  String phone;
  int phoneVerifiedStatus;
  String profileImage;
  int userCategory;
  String userName;
  int userStatus;
  int userType;
  String voucherCode;
  String adharNo;
  String religion;
  String caste;
  String bloodGroup;
  String pinCode;
  int allowLogin;
  String webAuthenticationCode;
  String androidAuthenticationCode;
  String webAuthenticationExpiredTime;
  String androidAuthenticationExpiredTime;

  LoginUser(
      {this.id,
        this.addedBy,
        this.address,
        this.appVersion,
        this.birthDate,
        this.dateCreated,
        this.dateModified,
        this.emailId,
        this.emailVerifiedStatus,
        this.fName,
        this.gender,
        this.instituteId,
        this.lName,
        this.latitude,
        this.latitudeRad,
        this.location,
        this.longitude,
        this.longitudeRad,
        this.maritalStatus,
        this.password,
        this.phone,
        this.phoneVerifiedStatus,
        this.profileImage,
        this.userCategory,
        this.userName,
        this.userStatus,
        this.userType,
        this.voucherCode,
        this.adharNo,
        this.religion,
        this.caste,
        this.bloodGroup,
        this.pinCode,
        this.allowLogin,
        this.webAuthenticationCode,
        this.androidAuthenticationCode,
        this.webAuthenticationExpiredTime,
        this.androidAuthenticationExpiredTime,

      });

  LoginUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedBy = json['added_by'];
    address = json['address'];
    appVersion = json['app_version'];
    birthDate = json['birth_date'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    emailId =  json['email_id'];
    emailVerifiedStatus = json['email_verified_status'];
    fName = json['f_name'];
    gender = json['gender'];
    instituteId = json['institute_id'];
    lName = json['l_name'];
    latitude = json['latitude'];
    latitudeRad = json['latitude_rad'];
    location = json['location'];
    longitude = json['longitude'];
    longitudeRad = json['longitude_rad'];
    maritalStatus = json['marital_status'];
    password = json['password'];
    phone =  json['phone'];
    phoneVerifiedStatus = json['phone_verified_status'];
    profileImage = json['profile_image'];
    userCategory = json['user_category'];
    userName = json['user_name'];
    userStatus = json['user_status'];
    userType = json['user_type'];
    voucherCode = json['voucher_code'];
    adharNo = json['adhar_no'];
    religion = json['religion'];
    caste = json['caste'];
    bloodGroup = json['blood_group'];
    pinCode = json['pin_code'];
    allowLogin = json['allow_login'];
    webAuthenticationCode = json['web_authentication_code'];
    androidAuthenticationCode = json['android_authentication_code'];
    webAuthenticationExpiredTime = json['web_authentication_expired_time'];
    androidAuthenticationExpiredTime = json['android_authentication_expired_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['added_by'] = this.addedBy;
    data['address'] = this.address;
    data['app_version'] = this.appVersion;
    data['birth_date'] = this.birthDate;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    data['email_id'] = this.emailId;
    data['email_verified_status'] = this.emailVerifiedStatus;
    data['f_name'] = this.fName;
    data['gender'] = this.gender;
    data['institute_id'] = this.instituteId;
    data['l_name'] = this.lName;
    data['latitude'] = this.latitude;
    data['latitude_rad'] = this.latitudeRad;
    data['location'] = this.location;
    data['longitude'] = this.longitude;
    data['longitude_rad'] = this.longitudeRad;
    data['marital_status'] = this.maritalStatus;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['phone_verified_status'] = this.phoneVerifiedStatus;
    data['profile_image'] = this.profileImage;
    data['user_category'] = this.userCategory;
    data['user_name'] = this.userName;
    data['user_status'] = this.userStatus;
    data['user_type'] = this.userType;
    data['voucher_code'] = this.voucherCode;
    data['adhar_no'] = this.adharNo;
    data['religion'] = this.religion;
    data['caste'] = this.caste;
    data['blood_group'] = this.bloodGroup;
    data['pin_code'] = this.pinCode;
    data['allow_login'] = this.allowLogin;
    data['web_authentication_code'] = this.webAuthenticationCode;
    data['android_authentication_code'] = this.androidAuthenticationCode;
    data['web_authentication_expired_time'] = this.webAuthenticationExpiredTime;
    data['android_authentication_expired_time'] = this.androidAuthenticationExpiredTime;
    return data;
  }
}
