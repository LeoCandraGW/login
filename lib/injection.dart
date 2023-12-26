import 'package:login/data/datasources/login_remote_datasource.dart';
import 'package:login/data/repositories/login_repository_impl.dart';
import 'package:login/domain/repositories/login_repository.dart';
import 'package:login/domain/usecase/post_login.dart';
import 'package:login/domain/usecase/post_logout.dart';
import 'package:get_it/get_it.dart';
import 'package:login/presentation/bloc/post_bloc.dart';
import 'package:http/io_client.dart';

final locator = GetIt.instance;
void init() {

  locator.registerFactory(() => PostLoginBloc(locator()));
  locator.registerFactory(() => PostLogoutBloc(locator()));

  locator.registerLazySingleton(() => PostLogin(locator()));
  locator.registerLazySingleton(() => PostLogout(locator()));

  locator.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(remoteDataSource: locator()));

  locator.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(client: locator()));

  locator.registerLazySingleton(() => IOClient());
}
