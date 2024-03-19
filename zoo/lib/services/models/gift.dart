class Gift {
  String name = '';
  double price = 0;
  String avatar = '';

  Gift({required this.name, required this.price, required this.avatar});

  Gift.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    avatar = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.avatar;
    return data;
  }
}
