import 'package:clean_arch/core/failure/app_failure.dart';
import 'package:clean_arch/core/failure/local_failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:clean_arch/core/failure/network_failure.dart';
import 'package:clean_arch/feature/user/data/datasource/remote/user_remote_datasource.dart';
import 'package:clean_arch/feature/user/domain/entity/user.dart';
import 'package:clean_arch/feature/user/domain/repository/user_repository.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource userRemoteDataSource;

  UserRepositoryImpl({
    required this.userRemoteDataSource,
  });

  @override
  Future<Either<AppFailure, User>> getUser(int id) async {
    try {
      final user = await userRemoteDataSource.getUserById(id);
      return Right(user);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(NetworkFailure.getException(e));
      } else {
        return Left(LocalFailure.fromException(e));
      }
    }
  }
}
