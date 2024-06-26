import 'package:clean_arch/core/failure/app_failure.dart';
import 'package:clean_arch/core/usecase/usecase.dart';
import 'package:clean_arch/feature/user/domain/entity/user.dart';
import 'package:clean_arch/feature/user/domain/repository/user_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserUsecase implements UseCase<User, int> {
  final UserRepository repository;
  const GetUserUsecase(this.repository);

  @override
  Future<Either<AppFailure, User>> call(int params) {
    return repository.getUser(params);
  }
}
