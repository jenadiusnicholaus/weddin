class Eventgroup {
  final String? id;
  final String? name;
  final String? description;
  final String? category;
  final String? imageUrl;
  final List<User>? member;

  Eventgroup({
    this.id,
    this.name,
    this.description,
    this.category,
    this.imageUrl,
    this.member,
  });

  factory Eventgroup.fromJson(Map<String, dynamic> json) {
    List groupMembers = json['members'] as List;
    return Eventgroup(
        id: json['id'],
        name: json["name"] != null ? json['name'] : null,
        category: json["category"] != null ? json['category'] : null,
        description: json["description"] != null ? json['description'] : null,
        imageUrl: json["image"] != null ? json['image'] : null,
        member: groupMembers.map((e) => User.fromJson(e)).toList());
  }

  // ignore: empty_constructor_bodies

}

class User {
  final String? id;
  final String? name;
  final String? phone;

  User({
    this.id,
    this.name,
    required this.phone,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] != null ? json['id'] : null,
      name: json["displayingname"] != null ? json['displayingname'] : null,
      phone: json["Phone"] != null ? json['Phone'] : null,
    );
  }
}
