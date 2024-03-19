class Gift {
  String name = '';
  double price = 0;
  String avatar = '';

  Gift({required this.name, required this.price, required this.avatar});

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
