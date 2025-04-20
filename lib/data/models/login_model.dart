import 'package:task_manager/data/models/user_model.dart';

class LoginModel {
  late final String status;
  late final String token;
  late final UserModel userModel;

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? '';
    token = json['token'] ?? '';
    userModel = UserModel.fromJson(json['data'] ?? {});
  }
}
