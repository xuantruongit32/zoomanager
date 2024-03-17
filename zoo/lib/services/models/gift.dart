class Gift {
  String? name;
  int? price;
  String? avatar;

  Gift({this.name, this.price, this.avatar});

  Gift.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['avatar'] = this.avatar;
    return data;
  }
}
