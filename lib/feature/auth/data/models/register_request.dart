class RegisterRequest {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => {
    "displayName": name,
    "email": email,
    "password": password,
    "phoneNumber": phoneNumber,
  };
}
