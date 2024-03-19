class House {
  String? id;
  String? name;
  int? num;
  String? story;
  String? avatar;
  String? cover;
  bool? online;
  int? followers;
  String? species;
  String? video;

  House(
      {this.id,
      this.name,
      this.num,
      this.story,
      this.avatar,
      this.cover,
      this.online,
      this.followers,
      this.species,
      this.video});

  House.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    num = json['num'];
    story = json['story'];
    avatar = json['avatar'];
    cover = json['cover'];
    online = json['onl'];
    followers = json['followers'];
    species = json['species'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['num'] = this.num;
    data['story'] = this.story;
    data['avatar'] = this.avatar;
    data['cover'] = this.cover;
    data['onl'] = this.online;
    data['followers'] = this.followers;
    data['species'] = this.species;
    data['video'] = this.video;
    return data;
  }
}
