import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:waffaraha_task/core/network/models/api_error_model.dart';
import 'package:waffaraha_task/features/photos/data/model/phote_model.dart';
import 'package:waffaraha_task/features/photos/data/repository/photos_repository_impl.dart';
import 'package:waffaraha_task/features/photos/domain/entity/photo_entity.dart';

import '../../../helper/test_helper.mocks.dart';

void main() {
  late MockPhotosRemoteDataSource mockPhotosRemoteDataSource;
  late PhotosRepositoryImpl photosRepositoryImpl;

  setUp(() {
    mockPhotosRemoteDataSource = MockPhotosRemoteDataSource();
    photosRepositoryImpl = PhotosRepositoryImpl(mockPhotosRemoteDataSource);
  });

  List<PhoteModel> dummyPhotos = [
    const PhoteModel(
      albumId: 1,
      id: 1,
      title: "accusamus beatae ad facilis cum similique qui sunt",
      thumbnailUrl: "https://via.placeholder.com/150/92c952",
    ),
  ];

  test('should get photos from remote data source', () async {
    // arrange
    when(mockPhotosRemoteDataSource.getPhotos())
        .thenAnswer((_) async => dummyPhotos);
    // act
    final result = await photosRepositoryImpl.getPhotos();
    // assert
    expect(result, Right<ApiFaliureModel, List<PhotoEntity>>(dummyPhotos));
  });
}
