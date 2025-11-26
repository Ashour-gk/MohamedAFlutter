class UserProperty {
  final String image;
  final String fname;
  final String sname;
  final String email;
  final String address;

  UserProperty({
    required this.sname,
    required this.image,
    required this.fname,
    required this.email,
    required this.address,
  });
}

class UserModel {
  final List<UserProperty> user;

  UserModel({required this.user});
  factory UserModel.fromjson({required Map<String, dynamic> json}) {
    final List<UserProperty> fulldata = json["results"].map<UserProperty>((i) {
      return UserProperty(
        image: i["picture"]["thumbnail"],
        fname: i["name"]["first"],
        sname: i["name"]["last"],
        email: i["email"],
        address: i["location"]["street"]["name"],
      );
    }).toList();
    return UserModel(user: fulldata);
  }
}
