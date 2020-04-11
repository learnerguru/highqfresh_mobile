
class ProductCategory {
  int id;
  String name;
  String description;
  String status;
  String date_created;
  String date_modified;
  String icon_url;
  String start_colour_code;
  String end_colour_code;
  String image_url;

  ProductCategory(
      {this.id,
        this.name,
        this.description,
        this.status,
        this.date_created,
        this.date_modified,
        this.icon_url,
        this.start_colour_code,
        this.end_colour_code,
        this.image_url,
      });

  ProductCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    status = json['status'];
    date_created =  json['date_created'];
    date_modified = json['date_modified'];
    icon_url = json['icon_url'];
    start_colour_code = json['start_colour_code'];
    end_colour_code = json['end_colour_code'];
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
    data['icon_url'] = this.icon_url;
    data['start_colour_code'] = this.start_colour_code;
    data['end_colour_code'] = this.end_colour_code;
    data['image_url'] = this.image_url;
    return data;
  }
}
