import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goToRegisterPage() {
    Get.toNamed("/register");
  }

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (isFormValid(email, password)) {
      Get.snackbar("Formulario valido", "Inicio de sesión exitoso");
      goToRegisterPage();
    }
  }

  bool isFormValid(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
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

    return true;
  }
}
