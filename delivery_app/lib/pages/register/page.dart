import 'package:flutter/material.dart';
import 'package:getx_flutter/pages/register/controller.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController controller = RegisterController();

  RegisterPage({super.key});

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
                  const SizedBox(height: 20),
                  _userAvatar(),
                  _textAppName(),
                  _boxForm(context)
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _textAlreadyHaveAnAccount(),
    );
  }

  Widget _textAlreadyHaveAnAccount() {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Ya tienes una cuenta?"),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () => controller.goToLoginPage(),
            child: const Text("Inicia sesión",
                style: TextStyle(color: Colors.red)),
          )
        ],
      ),
    );
  }

  Widget _userAvatar() {
    return GestureDetector(
      onTap: () => debugPrint("Select image"),
      child: const CircleAvatar(
        radius: 80,
        backgroundImage: AssetImage("assets/images/camera-placeholder.jpeg"),
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
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: const BoxDecoration(color: Colors.redAccent),
    );
  }

// Container for login fields
  Widget _boxForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: MediaQuery.of(context).size.height * 0.02,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black, blurRadius: 15, offset: Offset(0, 0.75)),
        ],
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 8,
        children: [
          _textLogin(),
          _inputName(),
          _inputLastName(),
          _inputPhone(),
          _inputEmail(),
          _inputPassword(),
          _inputConfirmPassword(),
          _buttonRegister(),
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

  Widget _inputName() {
    return TextField(
      controller: controller.nameController,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        hintText: "Nombre",
        labelText: "Nombre",
        prefixIcon: Icon(Icons.person),
      ),
    );
  }

  Widget _inputLastName() {
    return TextField(
      controller: controller.lastNameController,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        hintText: "Apellido",
        labelText: "Apellido",
        prefixIcon: Icon(Icons.family_restroom),
      ),
    );
  }

  Widget _inputPhone() {
    return TextField(
      controller: controller.phoneController,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        hintText: "Teléfono",
        labelText: "Teléfono",
        prefixIcon: Icon(Icons.phone),
      ),
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

  Widget _inputConfirmPassword() {
    return TextField(
      controller: controller.confirmPasswordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: "Confirmar Contraseña",
        labelText: "Confirmar Contraseña",
        prefixIcon: Icon(Icons.lock),
      ),
    );
  }

  Widget _buttonRegister() {
    return ElevatedButton(
      onPressed: () => controller.register(),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(40),
      ),
      child: const Text("Crear cuenta"),
    );
  }
}

/**
 * Should have:
 * 
 * Name
 * Last Name
 * Email
 * Password
 * Confirm Password
 * 
 * Note: validate all fields to ve valid
 * 
 * Note: Should Have circle avatar instead of delivery image and ask for an image
 * to be input from a camera or gallery
 * 
 */
