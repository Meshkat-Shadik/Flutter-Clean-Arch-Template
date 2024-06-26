import 'package:bloc/bloc.dart';
import 'package:clean_arch/core/failure/app_failure.dart';
import 'package:clean_arch/feature/user/domain/entity/user.dart';
import 'package:clean_arch/feature/user/domain/usecase/get_user_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUsecase getUserUsecase;
  UserBloc({
    required this.getUserUsecase,
  }) : super(const UserState.initial()) {
    on<WatchUserById>(
      (event, emit) async {
        emit(const UserState.loading());
        final result = await getUserUsecase(event.id);
        result.fold(
          (failure) => emit(UserState.error(failure)),
          (user) => emit(UserState.loaded(user)),
        );
      },
    );
  }
}
