
class HqOffers {
  int id;
  String image_url;
  int order_id;
  String title;
  String description;


  HqOffers(
      {this.id,
        this.title,
        this.description,
        this.image_url,
        this.order_id,
      });

  HqOffers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    order_id = json['order_id'];
     image_url = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['order_id'] = this.order_id;
    data['image_url'] = this.image_url;
    return data;
  }
}
