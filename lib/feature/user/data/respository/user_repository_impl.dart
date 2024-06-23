import 'package:clean_arch/core/failure/app_failure.dart';
import 'package:clean_arch/core/failure/failure_mapper.dart';
import 'package:fpdart/fpdart.dart';
import 'package:clean_arch/feature/user/data/datasource/remote/user_remote_datasource.dart';
import 'package:clean_arch/feature/user/domain/entity/user.dart';
import 'package:clean_arch/feature/user/domain/repository/user_repository.dart';

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
      return Left(FailureMapper.getFailures(e));
    }
  }
}
