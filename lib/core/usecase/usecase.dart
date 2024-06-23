import 'package:clean_arch/core/failure/app_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<T, P> {
  Future<Either<AppFailure, T>> call(P params);
}
