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

  User.fromDefault()
      : email = '',
        password = '',
        name = '游客',
        gender = '',
        birthday = '';
}

User currUser = User.fromDefault();
