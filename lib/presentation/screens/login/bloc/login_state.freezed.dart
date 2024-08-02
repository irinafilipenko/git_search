// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState {
  LoadingStatus get status => throw _privateConstructorUsedError;
  LoginModel? get user => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  bool get isPasswordValid => throw _privateConstructorUsedError;
  bool get isEmailValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {LoadingStatus status,
      LoginModel? user,
      String? errorMessage,
      String? email,
      String? password,
      bool isPasswordValid,
      bool isEmailValid});

  $LoginModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = freezed,
    Object? errorMessage = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? isPasswordValid = null,
    Object? isEmailValid = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as LoginModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      isPasswordValid: null == isPasswordValid
          ? _value.isPasswordValid
          : isPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmailValid: null == isEmailValid
          ? _value.isEmailValid
          : isEmailValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoginModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $LoginModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadingStatus status,
      LoginModel? user,
      String? errorMessage,
      String? email,
      String? password,
      bool isPasswordValid,
      bool isEmailValid});

  @override
  $LoginModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = freezed,
    Object? errorMessage = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? isPasswordValid = null,
    Object? isEmailValid = null,
  }) {
    return _then(_$LoginStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as LoginModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      isPasswordValid: null == isPasswordValid
          ? _value.isPasswordValid
          : isPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmailValid: null == isEmailValid
          ? _value.isEmailValid
          : isEmailValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl implements _LoginState {
  const _$LoginStateImpl(
      {this.status = LoadingStatus.initial,
      this.user,
      this.errorMessage,
      this.email,
      this.password,
      this.isPasswordValid = true,
      this.isEmailValid = true});

  @override
  @JsonKey()
  final LoadingStatus status;
  @override
  final LoginModel? user;
  @override
  final String? errorMessage;
  @override
  final String? email;
  @override
  final String? password;
  @override
  @JsonKey()
  final bool isPasswordValid;
  @override
  @JsonKey()
  final bool isEmailValid;

  @override
  String toString() {
    return 'LoginState(status: $status, user: $user, errorMessage: $errorMessage, email: $email, password: $password, isPasswordValid: $isPasswordValid, isEmailValid: $isEmailValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isPasswordValid, isPasswordValid) ||
                other.isPasswordValid == isPasswordValid) &&
            (identical(other.isEmailValid, isEmailValid) ||
                other.isEmailValid == isEmailValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, user, errorMessage,
      email, password, isPasswordValid, isEmailValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {final LoadingStatus status,
      final LoginModel? user,
      final String? errorMessage,
      final String? email,
      final String? password,
      final bool isPasswordValid,
      final bool isEmailValid}) = _$LoginStateImpl;

  @override
  LoadingStatus get status;
  @override
  LoginModel? get user;
  @override
  String? get errorMessage;
  @override
  String? get email;
  @override
  String? get password;
  @override
  bool get isPasswordValid;
  @override
  bool get isEmailValid;
  @override
  @JsonKey(ignore: true)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
