class GlobalSearchRequest {
  String word;

  GlobalSearchRequest({
    this.word,

  });

  GlobalSearchRequest.fromJson(Map<String, dynamic> json) {
    word = json['word'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['word'] = this.word;
    return data;
  }
}
