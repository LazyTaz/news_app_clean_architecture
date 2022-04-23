import 'package:news_app/domain/login/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required String username,
    required String token,
  }) : super(username: username, token: token);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(username: json['username'], token: json['token']);
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'token': token,
    };
  }
}
