import 'package:mockito/annotations.dart';
import 'package:waffaraha_task/core/network/network_provider/api_services.dart';
import 'package:waffaraha_task/features/photos/data/datesource/photos_remote_datasource.dart';
import 'package:waffaraha_task/features/photos/domain/repository/photos_repository.dart';
import 'package:waffaraha_task/features/photos/domain/usecase/get_photos_usecase.dart';

@GenerateMocks(
  [PhotosRepository, PhotosRemoteDataSource, GetPhotosUsecase],
  customMocks: [
    MockSpec<ApiService>(as: #MockApiService),
  ],
)
void main() {}
