import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/pages/login/controller.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              _boxCover(context),
              Column(
                children: [
                  _imageAnimation(),
                  _textAppName(),
                  _boxForm(context)
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _textDoesNotHaveAnAccount(),
    );
  }

  Widget _textDoesNotHaveAnAccount() {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("No tienes cuenta?"),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () => controller.goToRegisterPage(),
            child:
                const Text("Regístrate", style: TextStyle(color: Colors.red)),
          )
        ],
      ),
    );
  }

  Widget _textAppName() {
    return const Text(
      'Delivery App',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    );
  }

  Widget _boxCover(BuildContext context) {
    return Container(
      //width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.45,
      decoration: const BoxDecoration(color: Colors.redAccent),
    );
  }

  Widget _imageAnimation() {
    return Container(
      alignment: Alignment.center,
      //margin: const EdgeInsets.only(top: 10),
      height: 220,
      child: Lottie.asset("assets/json/animation.json"),
    );
  }

// Container for login fields
  Widget _boxForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black, blurRadius: 15, offset: Offset(0, 0.75)),
        ],
      ),
      child: Column(
        children: [
          _textLogin(),
          _inputEmail(),
          const SizedBox(height: 20),
          _inputPassword(),
          const SizedBox(height: 20),
          _buttonLogin(),
        ],
      ),
    );
  }

  Widget _textLogin() {
    return const Text(
      'INGRESA TUS DATOS',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _inputEmail() {
    return TextField(
      controller: controller.emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: "Email",
        labelText: "Email",
        prefixIcon: Icon(Icons.email),
      ),
    );
  }

  Widget _inputPassword() {
    return TextField(
      controller: controller.passwordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: "Password",
        labelText: "Password",
        prefixIcon: Icon(Icons.lock),
      ),
    );
  }

  Widget _buttonLogin() {
    return ElevatedButton(
      onPressed: () => controller.login(),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(40),
      ),
      child: const Text("Login"),
    );
  }
}
