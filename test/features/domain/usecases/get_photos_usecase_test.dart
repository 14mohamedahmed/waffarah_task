import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:waffaraha_task/core/network/models/api_error_model.dart';
import 'package:waffaraha_task/features/photos/domain/entity/photo_entity.dart';
import 'package:waffaraha_task/features/photos/domain/usecase/get_photos_usecase.dart';

import '../../../helper/test_helper.mocks.dart';

void main() {
  late GetPhotosUsecase getPhotosUsecase;
  late MockPhotosRepository mockPhotosRepository;

  setUp(() {
    mockPhotosRepository = MockPhotosRepository();
    getPhotosUsecase = GetPhotosUsecase(mockPhotosRepository);
  });

  List<PhotoEntity> photoEntity = [
    const PhotoEntity(
      albumId: 1,
      id: 1,
      title: "accusamus beatae ad facilis cum similique qui sunt",
      thumbnailUrl: "https://via.placeholder.com/150/92c952",
    )
  ];

  test('should get photos from repository', () async {
    // arrange
    when(mockPhotosRepository.getPhotos())
        .thenAnswer((_) async => Right(photoEntity));
    // act
    final result = await getPhotosUsecase.call();
    // assert
    expect(result, Right<ApiFaliureModel, List<PhotoEntity>>(photoEntity));
  });
}
