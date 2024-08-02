import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';

part 'login_model.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LoginResponse({
    required List<LoginModel> results,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, Object?> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class LoginModel with _$LoginModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LoginModel({
    required String email,
    required Name name,
    required Picture picture,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, Object?> json) =>
      _$LoginModelFromJson(json);
}

@freezed
class Name with _$Name {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Name({
    required String first,
    required String last,
  }) = _Name;

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}

@freezed
class Picture with _$Picture {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Picture({
    required String large,
    required String medium,
    required String thumbnail,
  }) = _Picture;

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);
}

// @freezed
// class Login with _$Login {
//   const factory Login({
//     required String username,
//   }) = _Login;
//
//   factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
// }
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
