import 'package:clean_arch/core/failure/app_failure.dart';
import 'package:clean_arch/feature/user/domain/entity/user.dart';
import 'package:fpdart/fpdart.dart';

abstract class UserRepository {
  Future<Either<AppFailure, User>> getUser(int id);
}
