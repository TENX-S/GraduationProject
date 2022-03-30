import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String? _email;
  String? _password;
  String? _name;
  String? _gender;
  String? _birthday;

  String get email => _email ?? '';
  String get password => _password ?? '';
  String get name => _name ?? '游客';
  String get gender => _gender ?? '';
  String get birthday => _birthday ?? '';

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  set password(String value) {
    _password = value;
  }

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  set gender(String value) {
    _gender = value;
    notifyListeners();
  }

  set birthday(String value) {
    _birthday = value;
    notifyListeners();
  }
}

User currUser = User();
