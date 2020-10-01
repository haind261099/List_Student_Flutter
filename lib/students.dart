class Students {
  Students({
    this.id,
    this.name,
    this.avatar,
    this.age,
    this.address,
  });

  final int id;
  final String name;
  final String avatar;
  final int age;
  final String address;

  factory Students.fromJson(Map<String, dynamic> data) => Students(
        id: data["id"],
        name: data["name"],
        avatar: data["avatar"],
        age: data["age"],
        address: data["address"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar,
        "age": age,
        "address": address,
      };
}
