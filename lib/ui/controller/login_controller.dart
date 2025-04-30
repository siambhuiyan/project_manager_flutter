import 'package:get/get.dart';
import '../../data/models/login_model.dart';
import '../../data/service/network_client.dart';
import '../../data/utils/urls.dart';
import 'auth_controller.dart';

class LogInController extends GetxController {
  bool _signInProgress = false;
  bool get signInProgress => _signInProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> login(String email, String password) async {
    bool isSuccess = false;
    _signInProgress = true;
    update();
    Map<String, dynamic> requestBody = {
      'email': email,
      'password': password,
    };
    NetworkResponse response =
        await NetworkClient.postRequest(url: Urls.logInUrl, body: requestBody);

    if (response.isSuccess) {
      LoginModel loginModel = LoginModel.fromJson(response.data!);
      await AuthController.saveUserInformation(
          loginModel.token, loginModel.userModel);
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _signInProgress = false;
    update();

    return isSuccess;
  }
}
