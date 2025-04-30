import 'package:get/get.dart';
import 'package:task_manager/ui/controller/login_controller.dart';
import 'package:task_manager/ui/controller/new_task_controller.dart';
import 'package:task_manager/ui/controller/register_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(LogInController());
    Get.put(NewTaskController());
    Get.put(RegisterController());
  }
}
