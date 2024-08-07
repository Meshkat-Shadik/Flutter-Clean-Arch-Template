part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.data(User user) = _Loaded;
  const factory UserState.error(AppFailure failure) = _Error;
}
