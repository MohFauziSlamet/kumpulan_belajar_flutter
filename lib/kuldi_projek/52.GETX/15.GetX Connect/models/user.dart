class User {
  String? id;
  String? name;
  String? email;
  String? phone;

  User({required this.id, this.name, this.email, this.phone});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    id = json['phone'];
  }

  static Map<String, dynamic>? listFromJson(Map<String, dynamic> data) {
    if (data.isEmpty || data.isEmpty) {
      return {};
    }
    return data;
  }

  List<User?> listFromToJson(List data) {
    if (data.isEmpty) return [];

    return data.map((e) {
      listFromJson(e);
    }).toList();
  }
}
