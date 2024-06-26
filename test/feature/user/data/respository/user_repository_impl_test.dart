import 'dart:io';

import 'package:clean_arch/core/failure/app_failure.dart';
import 'package:clean_arch/core/failure/failure_mapper.dart';
import 'package:clean_arch/core/failure/network_failure.dart';
import 'package:clean_arch/feature/user/data/datasource/remote/user_remote_datasource.dart';
import 'package:clean_arch/feature/user/data/mappers/user_mapper.dart';
import 'package:clean_arch/feature/user/data/respository/user_repository_impl.dart';
import 'package:clean_arch/feature/user/domain/entity/user.dart';
import 'package:clean_arch/feature/user/domain/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';

class MockUserRemoteDatasource extends Mock implements UserRemoteDatasource {}

void main() {
  late UserRepository userRepository;
  late MockUserRemoteDatasource mockUserRemoteDatasource;

  setUp(() {
    mockUserRemoteDatasource = MockUserRemoteDatasource();
    userRepository =
        UserRepositoryImpl(userRemoteDataSource: mockUserRemoteDatasource);
  });

  const tUser = User(
    id: 1,
    name: 'Test User',
    username: 'test_user',
    email: 'testuser@gmail.com',
    phone: '1234567890',
    website: 'testuser.com',
  );

  const tUserId = 1;

  test('should return User when the call to remote data source is successful',
      () async {
    // Arrange
    when(() => mockUserRemoteDatasource.getUserById(tUserId))
        .thenAnswer((_) async => Future.value(UserMapper.toDto(tUser)));

    // Act
    final result = await userRepository.getUser(tUserId);

    // Assert
    verify(() => mockUserRemoteDatasource.getUserById(tUserId)).called(1);
    expect(result, Right<AppFailure, User>(UserMapper.toDto(tUser)));
  });

  //should return Failure when the call to remote data source is unsuccessful
  test(
      'should return AppFailure when the call to remote data source is unsuccessful',
      () async {
    // Arrange
    const tException =
        PathNotFoundException('Failed to load user', OSError('error'));

    when(() => mockUserRemoteDatasource.getUserById(tUserId))
        .thenThrow(tException);

    // Act
    final result = await userRepository.getUser(tUserId);

    // Assert
    verify(() => mockUserRemoteDatasource.getUserById(tUserId)).called(1);
    expect(result.isLeft(), true);

    result.fold(
      (failure) {
        expect(failure, isA<AppFailure>());
        final appFailure = FailureMapper.getFailures(tException);
        expect(failure.message, equals(appFailure.message));
        debugPrint('Failure: ${appFailure.toString()}');
      },
      (user) => fail('Expected an AppFailure, but got a User'),
    );
  });

  //return DioException when the call to remote data source is unsuccessful
  test(
      'should return DioException when the call to remote data source is unsuccessful',
      () async {
    // Arrange
    final tException = DioException(
      requestOptions: RequestOptions(path: '/users/$tUserId'),
      response: Response(
          statusCode: 403,
          requestOptions: RequestOptions(path: '/users/$tUserId'),
          statusMessage: 'Failed to load user (StatusMessage)'),
      message: 'Failed to load user',
    );

    when(() => mockUserRemoteDatasource.getUserById(tUserId))
        .thenThrow(tException);

    // Act
    final result = await userRepository.getUser(tUserId);

    // Assert
    verify(() => mockUserRemoteDatasource.getUserById(tUserId)).called(1);
    expect(result.isLeft(), true);

    result.fold(
      (failure) {
        expect(failure, isA<NetworkFailure>());
        final networkFailure = NetworkFailure.getDioException(tException);
        expect(failure.message, equals(networkFailure.message));
        debugPrint('Failure: ${networkFailure.toString()}');
      },
      (user) => fail('Expected an NetworkFailure, but got a User'),
    );
  });
}
