import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel({
    required String email,
    required String fullName,
    required String avatarUrl,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

// class LoginModel {
//   final String email;
//   final String fullName;
//   final String avatarUrl;
//
//   const LoginModel(
//       {required this.email, required this.fullName, required this.avatarUrl});
//
//   factory LoginModel.fromJson(Map<String, dynamic> json) {
//     return LoginModel(
//       email: json['email'],
//       fullName: json['name']['first'] + ' ' + json['name']['last'],
//       avatarUrl: json['picture']['large'],
//     );
//   }
// }
