import 'package:get_it/get_it.dart';
import 'package:waffaraha_task/core/network/network_provider/api_services.dart';
import 'package:waffaraha_task/core/network/network_provider/dio_api_service_impl.dart';
import 'package:waffaraha_task/core/services/navigation_service.dart';
import 'package:waffaraha_task/features/photos/data/datesource/photos_remote_datasource.dart';
import 'package:waffaraha_task/features/photos/data/repository/photos_repository_impl.dart';
import 'package:waffaraha_task/features/photos/domain/repository/photos_repository.dart';
import 'package:waffaraha_task/features/photos/domain/usecase/get_photos_usecase.dart';
import 'package:waffaraha_task/features/photos/presentation/controller/photos_bloc.dart';

GetIt getIt = GetIt.instance;

setupSingeltonServices() async {
  getIt.registerLazySingleton<ApiService>(() => DioApiServiceImpl());
  getIt.registerLazySingleton(() => NavigationService());
  _photosDI();
}

_photosDI() {
  getIt.registerLazySingleton<PhotosRemoteDataSource>(
      () => PhotosRemoteDataSourceImpl(getIt()));
  getIt.registerLazySingleton<PhotosRepository>(
      () => PhotosRepositoryImpl(getIt()));
  getIt.registerLazySingleton(() => GetPhotosUsecase(getIt()));
  getIt.registerFactory(() => PhotosBloc(getIt()));
}
