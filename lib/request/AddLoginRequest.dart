class AddLoginRequest {
  String insCode;
  String userName;
  String password;
  String deviceModel;
  String deviceName;
  String devicePlatform;
  String deviceToken;
  String deviceUuid;
  String deviceVersion;

  AddLoginRequest(
      {this.insCode,
        this.userName,
        this.password,
        this.deviceModel,
        this.deviceName,
        this.devicePlatform,
        this.deviceToken,
        this.deviceUuid,
        this.deviceVersion});

  AddLoginRequest.fromJson(Map<String, dynamic> json) {
    insCode = json['ins_code'];
    userName = json['user_name'];
    password = json['password'];
    deviceModel = json['device_model'];
    deviceName = json['device_name'];
    devicePlatform = json['device_platform'];
    deviceToken = json['device_token'];
    deviceUuid = json['device_uuid'];
    deviceVersion = json['device_version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ins_code'] = this.insCode;
    data['user_name'] = this.userName;
    data['password'] = this.password;
    data['device_model'] = this.deviceModel;
    data['device_name'] = this.deviceName;
    data['device_platform'] = this.devicePlatform;
    data['device_token'] = this.deviceToken;
    data['device_uuid'] = this.deviceUuid;
    data['device_version'] = this.deviceVersion;
    return data;
  }
}
