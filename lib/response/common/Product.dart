
class Product {
  int id;
  String name;
  String description;
  String image_url;
  int product_category_id;
  String date_created;
  String date_modified;
  int status;


  Product(
      {this.id,
        this.name,
        this.description,
        this.status,
        this.date_created,
        this.date_modified,
        this.image_url,
        this.product_category_id,
      });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    status = json['status'];
    date_created =  json['date_created'];
    date_modified = json['date_modified'];
    product_category_id = json['product_category_id'];
     image_url = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['status'] = this.status;
    data['date_created'] = this.date_created;
    data['date_modified'] = this.date_modified;
    data['product_category_id'] = this.product_category_id;
    data['image_url'] = this.image_url;
    return data;
  }
}
