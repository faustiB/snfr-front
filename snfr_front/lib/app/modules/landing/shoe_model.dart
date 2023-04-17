
class Shoe {
  String? image;
  String? price;
  String? title;
  String? url;

  Shoe({this.image, this.price, this.title, this.url});

  Shoe.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    price = json['price'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['price'] = price;
    data['title'] = title;
    data['url'] = url;
    return data;
  }
}
