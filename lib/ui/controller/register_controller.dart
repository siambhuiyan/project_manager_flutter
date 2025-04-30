import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/service/network_client.dart';
import '../../../data/utils/urls.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;

  void submit() {
    if (formKey.currentState!.validate()) {
      registerUser();
    }
  }

  void registerUser() async {
    isLoading.value = true;

    final response = await NetworkClient.postRequest(
      url: Urls.registerUrl,
      body: {
        'email': emailController.text.trim(),
        'firsName': firstNameController.text.trim(),
        'lastName': lastNameController.text.trim(),
        'mobile': mobileController.text.trim(),
        'password': passwordController.text.trim(),
      },
    );

    isLoading.value = false;

    if (response.isSuccess) {
      Get.snackbar('Success', 'User registered successfully!',
          snackPosition: SnackPosition.BOTTOM);
      clearForm();
    } else {
      Get.snackbar('Error', response.errorMessage,
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.redAccent, colorText: Colors.white);
    }
  }

  void clearForm() {
    emailController.clear();
    firstNameController.clear();
    lastNameController.clear();
    mobileController.clear();
    passwordController.clear();
  }

  @override
  void onClose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
