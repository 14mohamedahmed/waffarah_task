import 'package:get_it/get_it.dart';
import 'package:waffaraha_task/core/network/network_provider/api_services.dart';
import 'package:waffaraha_task/core/network/network_provider/dio_api_service_impl.dart';
import 'package:waffaraha_task/core/services/navigation_service.dart';

GetIt getIt = GetIt.instance;

setupSingeltonServices() async {
  getIt.registerLazySingleton<ApiService>(() => DioApiServiceImpl());
  getIt.registerLazySingleton(() => NavigationService());
  _loginDI();
}

_loginDI() {
  // getIt.registerLazySingleton<LoginRemoteDatasource>(
  //     () => LoginRemoteDatasourceImpl(getIt()));
  // getIt.registerLazySingleton<LoginRepository>(
  //     () => LoginRepositoryImpl(getIt()));
  // getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  // getIt.registerFactory(() => LoginBloc(getIt()));
}
