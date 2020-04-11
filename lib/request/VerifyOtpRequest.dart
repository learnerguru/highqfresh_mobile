class VerifyOtpRequest {
  String mobile_no;
  String otp;

  VerifyOtpRequest(
      {this.mobile_no,
      this.otp,
       });

  VerifyOtpRequest.fromJson(Map<String, dynamic> json) {
    mobile_no = json['mobile_no'];
    otp = json['otp'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_no'] = this.mobile_no;
    data['otp'] = this.otp;

    return data;
  }
}
