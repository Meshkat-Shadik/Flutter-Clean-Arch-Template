import 'package:bloc_test/bloc_test.dart';
import 'package:clean_arch/core/failure/local_failure.dart';
import 'package:clean_arch/core/failure/network_failure.dart';
import 'package:clean_arch/feature/user/domain/entity/user.dart';
import 'package:clean_arch/feature/user/domain/usecase/get_user_usecase.dart';
import 'package:clean_arch/feature/user/presentation/viewmodel/user_bloc/user_bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockGetUserUsecase extends Mock implements GetUserUsecase {}

void main() {
  late GetUserUsecase getUserUsecase;

  setUp(() {
    getUserUsecase = MockGetUserUsecase();
  });

  const user = User(
    id: 1,
    name: 'Leanne Graham',
    username: 'Bret',
    email: 'Sincere@april.biz',
    phone: '1-770-736-8031 x56442',
    website: 'hildegard.org',
  );
  const localFailure = LocalFailure(
    message: 'Local Failure',
    name: 'Local Failure',
  );
  const networkFailure = NetworkFailure(
    message: 'Network Failure',
    name: 'Network Failure',
    uriPath: 'uriPath',
    statusCode: 404,
  );
  group(
    'User Bloc Test Group',
    () {
      blocTest<UserBloc, UserState>(
        'emits [MyState] when MyEvent is added.',
        setUp: () {
          when(() => getUserUsecase(1)).thenAnswer(
            (_) async => const Right(user),
          );
        },
        build: () => UserBloc(getUserUsecase: getUserUsecase),
        act: (bloc) => bloc.add(const UserEvent.watchUserById(1)),
        skip: 1,
        expect: () => const <UserState>[UserState.loaded(user)],
        verify: (bloc) {
          verify(() => getUserUsecase(1)).called(1);
          verifyNoMoreInteractions(getUserUsecase);
        },
      );

      //failure test
      blocTest<UserBloc, UserState>(
        'emits [Failure] when MyEvent is added.',
        setUp: () {
          when(() => getUserUsecase(1)).thenAnswer(
            (_) async => const Left(localFailure),
          );
        },
        build: () => UserBloc(getUserUsecase: getUserUsecase),
        act: (bloc) => bloc.add(const UserEvent.watchUserById(1)),
        skip: 1,
        expect: () => const <UserState>[UserState.error(localFailure)],
        verify: (bloc) {
          verify(() => getUserUsecase(1)).called(1);
          verifyNoMoreInteractions(getUserUsecase);
        },
      );

      //failure test for network
      blocTest<UserBloc, UserState>(
        'emits [Failure] when MyEvent is added.',
        setUp: () {
          when(() => getUserUsecase(1)).thenAnswer(
            (_) async => const Left(networkFailure),
          );
        },
        build: () => UserBloc(getUserUsecase: getUserUsecase),
        act: (bloc) => bloc.add(const UserEvent.watchUserById(1)),
        skip: 1,
        expect: () => const <UserState>[UserState.error(networkFailure)],
        verify: (bloc) {
          verify(() => getUserUsecase(1)).called(1);
          verifyNoMoreInteractions(getUserUsecase);
        },
      );
    },
  );
}
