class SendOtpRequest {
  String mobile_no;

  SendOtpRequest(
      {this.mobile_no,
       });

  SendOtpRequest.fromJson(Map<String, dynamic> json) {
    mobile_no = json['mobile_no'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_no'] = this.mobile_no;

    return data;
  }
}
