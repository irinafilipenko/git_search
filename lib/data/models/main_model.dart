import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_model.freezed.dart';
part 'main_model.g.dart';

@freezed
class MainResponse with _$MainResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MainResponse({
    required List<MainModel> items,
  }) = _MainResponse;

  factory MainResponse.fromJson(Map<String, Object?> json) =>
      _$MainResponseFromJson(json);
}

@freezed
class MainModel with _$MainModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MainModel({
    required String id,
    required String name,
    @Default(false) bool? is_favorite,
  }) = _MainModel;

  factory MainModel.fromJson(Map<String, Object?> json) =>
      _$MainModelFromJson(json);
}
