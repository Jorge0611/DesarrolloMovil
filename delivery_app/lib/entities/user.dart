class RegisterBody {
  String email;
  String name;
  String lastname;
  String phone;
  String? image;
  String password;

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "lastname": lastname,
        "phone": phone,
        "image": image,
        "password": password,
      };

  RegisterBody({
    required this.email,
    required this.name,
    required this.lastname,
    required this.phone,
    this.image,
    required this.password,
  });
}
