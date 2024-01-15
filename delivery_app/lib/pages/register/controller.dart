import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/entities/user.dart';
import 'package:getx_flutter/helpers/register_helper.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void goToLoginPage() {
    Get.toNamed("/");
  }

  void goBack() {
    Get.back();
  }

  void register() async {
    String name = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    String phone = phoneController.text.trim();

    bool isValid =
        isFormValid(name, lastName, email, password, confirmPassword, phone);

    if (isValid) {
      RegisterBody registerBody = RegisterBody(
        email: email,
        name: name,
        lastname: lastName,
        phone: phone,
        password: password,
      );

      final response = await RegisterHelper().createUser(registerBody);

      if (response.success) {
        Get.snackbar("Formulario valido", "Registro exitoso");
        goToLoginPage();
      } else {
        Get.snackbar("Formulario invalido", response.message);
      }
    }
  }

  bool isFormValid(String name, String lastName, String email, String password,
      String confirmPassword, String phone) {
    if (name.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        phone.isEmpty) {
      Get.snackbar("Formulario invalido", "Todos los campos son obligatorios");
      return false;
    }

    if (GetUtils.isEmail(email) == false) {
      Get.snackbar("Formulario invalido", "Email invalido");
      return false;
    }

    if (password.length < 6) {
      Get.snackbar(
          "Formulario invalido", "Password debe tener al menos 6 caracteres");
      return false;
    }

    if (password != confirmPassword) {
      Get.snackbar("Formulario invalido", "Las contraseñas no coinciden");
      return false;
    }

    return true;
  }
}
