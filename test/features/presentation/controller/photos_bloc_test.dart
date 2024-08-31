import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:waffaraha_task/core/utils/enums.dart';
import 'package:waffaraha_task/features/photos/presentation/controller/photos_bloc.dart';

import '../../../helper/dummy_photos_list_test.dart';
import '../../../helper/test_helper.mocks.dart';

void main() {
  late MockGetPhotosUsecase mockGetPhotosUsecase;
  late PhotosBloc photosBloc;

  setUp(() {
    mockGetPhotosUsecase = MockGetPhotosUsecase();
    photosBloc = PhotosBloc(mockGetPhotosUsecase);
  });

  test('initial state of PhotosBloc is Empty', () {
    expect(photosBloc.state, const PhotosState());
  });

  blocTest<PhotosBloc, PhotosState>(
    'emits [PhotosBloc] when Photos data is gotten.',
    build: () {
      when(mockGetPhotosUsecase()).thenAnswer(
        (_) async => Right(photosEntity),
      );
      return photosBloc;
    },
    act: (bloc) => bloc.add(GetPhotosEvent()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      const PhotosState(getPhotosState: RequestStatus.loading),
      PhotosState(
        getPhotosState: RequestStatus.success,
        photos: photosEntity,
        currentPagePhotos: photosBloc.getCurrentPagePhotos(photosEntity),
      ),
    ],
  );
}
