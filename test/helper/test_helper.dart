import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:waffaraha_task/features/photos/domain/repository/photos_repository.dart';

@GenerateMocks(
  [PhotosRepository],
  customMocks: [
    MockSpec<Dio>(as: #MockDioClient),
  ],
)
void main() {}
