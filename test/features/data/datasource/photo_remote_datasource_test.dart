import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:waffaraha_task/core/network/api_constants.dart';
import 'package:waffaraha_task/core/network/models/api_success_model.dart';
import 'package:waffaraha_task/features/photos/data/datesource/photos_remote_datasource.dart';
import 'package:waffaraha_task/features/photos/data/model/phote_model.dart';

import '../../../helper/json_reader_test.dart';
import '../../../helper/test_helper.mocks.dart';

void main() {
  late PhotosRemoteDataSourceImpl photoRemoteDatasourceImpl;
  late MockApiService apiService;

  setUp(() {
    apiService = MockApiService();
    photoRemoteDatasourceImpl = PhotosRemoteDataSourceImpl(apiService);
  });

  test('should return list of photos from API ', () async {
    // arrange
    when(apiService.get(ApiConstants.photos)).thenAnswer(
      (_) async => Right(
        ApiSuccessModel(
            statusCode: 200,
            data: jsonDecode(readJson('helper/dummy_data_test.json')),
            message: "Success"),
      ),
    );
    // act
    final result = await photoRemoteDatasourceImpl.getPhotos();
    // assert
    expect(result, isA<List<PhoteModel>>());
  });
}
