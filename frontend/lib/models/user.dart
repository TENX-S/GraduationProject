late User currentUser;

class User {
  String email;
  String password;
  String? name;
  String? gender;
  String? birthday;

  User({
    required this.email,
    required this.password,
  });
}
