import 'package:get/get.dart';
import '../../data/models/login_model.dart';
import '../../data/service/network_client.dart';
import '../../data/utils/urls.dart';
import 'auth_controller.dart';

class NewTaskController extends GetxController {
  bool _getNewTaskInProgress = false;
  bool get getNewTaskInProgress => _getNewTaskInProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> getNewTaskList() async {
    bool isSuccess = false;
    _getNewTaskInProgress = true;
    update();

    NetworkResponse response =
        await NetworkClient.getRequest(url: Urls.logInUrl,);

    if (response.isSuccess) {
      // TaskListModel taskListModel = TaskListModel.fromJson(response.data??{});
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _getNewTaskInProgress= false;
    update();

    return isSuccess;
  }
}
