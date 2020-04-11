class UserRegisterRequest {

  String user_name;
  String password;
  String mobile_no;
  String name;
  String address;
  String email_id;
  double latitude;
  double longitude;


  String deviceModel;
  String deviceName;
  String devicePlatform;
  String deviceToken;
  String deviceUuid;
  String deviceVersion;

  UserRegisterRequest(
      {
        this.user_name,
        this.password,
        this.mobile_no,
        this.name,
        this.address,
        this.email_id,
        this.latitude,
        this.longitude,

        this.deviceModel,
        this.deviceName,
        this.devicePlatform,
        this.deviceToken,
        this.deviceUuid,
        this.deviceVersion});

  UserRegisterRequest.fromJson(Map<String, dynamic> json) {
    user_name = json['user_name'];
    password = json['password'];
    mobile_no = json['mobile_no'];
    name = json['name'];
    address = json['address'];
    email_id = json['email_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];

    deviceModel = json['device_model'];
    deviceName = json['device_name'];
    devicePlatform = json['device_platform'];
    deviceToken = json['device_token'];
    deviceUuid = json['device_uuid'];
    deviceVersion = json['device_version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.user_name;
    data['password'] = this.password;
    data['mobile_no'] = this.mobile_no;
    data['name'] = this.name;
    data['address'] = this.address;
    data['email_id'] = this.email_id;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;

    data['device_model'] = this.deviceModel;
    data['device_name'] = this.deviceName;
    data['device_platform'] = this.devicePlatform;
    data['device_token'] = this.deviceToken;
    data['device_uuid'] = this.deviceUuid;
    data['device_version'] = this.deviceVersion;
    return data;
  }
}
