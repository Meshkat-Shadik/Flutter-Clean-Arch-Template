// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_arch/core/di/app_di_module.dart' as _i9;
import 'package:clean_arch/feature/user/data/datasource/remote/user_remote_datasource.dart'
    as _i4;
import 'package:clean_arch/feature/user/data/respository/user_repository_impl.dart'
    as _i6;
import 'package:clean_arch/feature/user/di/user_di_module.dart' as _i10;
import 'package:clean_arch/feature/user/domain/repository/user_repository.dart'
    as _i5;
import 'package:clean_arch/feature/user/domain/usecase/get_user_usecase.dart'
    as _i7;
import 'package:clean_arch/feature/user/presentation/viewmodel/user_bloc/user_bloc.dart'
    as _i8;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appDiModule = _$AppDiModule();
    final userRemoteDatasourceDI = _$UserRemoteDatasourceDI();
    gh.singleton<_i3.Dio>(() => appDiModule.createDio());
    gh.lazySingleton<_i4.UserRemoteDatasource>(
        () => userRemoteDatasourceDI.userRemoteDatasource(gh<_i3.Dio>()));
    gh.lazySingleton<_i5.UserRepository>(() => _i6.UserRepositoryImpl(
        userRemoteDataSource: gh<_i4.UserRemoteDatasource>()));
    gh.factory<_i7.GetUserUsecase>(
        () => _i7.GetUserUsecase(gh<_i5.UserRepository>()));
    gh.factory<_i8.UserBloc>(
        () => _i8.UserBloc(getUserUsecase: gh<_i7.GetUserUsecase>()));
    return this;
  }
}

class _$AppDiModule extends _i9.AppDiModule {}

class _$UserRemoteDatasourceDI extends _i10.UserRemoteDatasourceDI {}
