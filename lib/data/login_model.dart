class LoginModel {
  final String email;
  final String fullName;
  final String avatarUrl;

  const LoginModel(
      {required this.email, required this.fullName, required this.avatarUrl});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'],
      fullName: json['name']['first'] + ' ' + json['name']['last'],
      avatarUrl: json['picture']['large'],
    );
  }
}
