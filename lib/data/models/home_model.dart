import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_model.freezed.dart';
part 'home_model.g.dart';

@freezed
class HomeResponse with _$HomeResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HomeResponse({
    required List<HomeModel> items,
  }) = _HomeResponse;

  factory HomeResponse.fromJson(Map<String, Object?> json) =>
      _$HomeResponseFromJson(json);
}

@freezed
class HomeModel with _$HomeModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HomeModel({
    required String id,
    required String name,
    @Default(false) bool? isFavorite,
  }) = _HomeModel;

  factory HomeModel.fromJson(Map<String, Object?> json) =>
      _$HomeModelFromJson(json);
}
