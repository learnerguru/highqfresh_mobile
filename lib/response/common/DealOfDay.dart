
class DealOfDay {
  int id;
  int product_id;
  String date_created;
  String date_modified;


  DealOfDay(
      {this.id,
        this.date_created,
        this.date_modified,
        this.product_id,
      });

  DealOfDay.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date_created = json['date_created'];
    date_modified = json['date_modified'];
    product_id = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.date_created;
    data['date_modified'] = this.date_modified;
    data['product_id'] = this.product_id;
    return data;
  }
}
