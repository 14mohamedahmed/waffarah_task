// Mocks generated by Mockito 5.4.4 from annotations
// in waffaraha_task/test/helper/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:waffaraha_task/core/network/models/api_error_model.dart' as _i5;
import 'package:waffaraha_task/core/network/models/api_success_model.dart'
    as _i10;
import 'package:waffaraha_task/core/network/network_provider/api_services.dart'
    as _i9;
import 'package:waffaraha_task/features/photos/data/datesource/photos_remote_datasource.dart'
    as _i7;
import 'package:waffaraha_task/features/photos/data/model/phote_model.dart'
    as _i8;
import 'package:waffaraha_task/features/photos/domain/entity/photo_entity.dart'
    as _i6;
import 'package:waffaraha_task/features/photos/domain/repository/photos_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PhotosRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPhotosRepository extends _i1.Mock implements _i3.PhotosRepository {
  MockPhotosRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.ApiFaliureModel, List<_i6.PhotoEntity>>>
      getPhotos() => (super.noSuchMethod(
            Invocation.method(
              #getPhotos,
              [],
            ),
            returnValue: _i4.Future<
                    _i2
                    .Either<_i5.ApiFaliureModel, List<_i6.PhotoEntity>>>.value(
                _FakeEither_0<_i5.ApiFaliureModel, List<_i6.PhotoEntity>>(
              this,
              Invocation.method(
                #getPhotos,
                [],
              ),
            )),
          ) as _i4
              .Future<_i2.Either<_i5.ApiFaliureModel, List<_i6.PhotoEntity>>>);
}

/// A class which mocks [PhotosRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPhotosRemoteDataSource extends _i1.Mock
    implements _i7.PhotosRemoteDataSource {
  MockPhotosRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i8.PhoteModel>> getPhotos() => (super.noSuchMethod(
        Invocation.method(
          #getPhotos,
          [],
        ),
        returnValue: _i4.Future<List<_i8.PhoteModel>>.value(<_i8.PhoteModel>[]),
      ) as _i4.Future<List<_i8.PhoteModel>>);
}

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i9.ApiService {
  MockApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.ApiFaliureModel, _i10.ApiSuccessModel>> get(
    String? path, {
    Map<String, dynamic>? queryParameters = const {},
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [path],
          {#queryParameters: queryParameters},
        ),
        returnValue: _i4.Future<
                _i2.Either<_i5.ApiFaliureModel, _i10.ApiSuccessModel>>.value(
            _FakeEither_0<_i5.ApiFaliureModel, _i10.ApiSuccessModel>(
          this,
          Invocation.method(
            #get,
            [path],
            {#queryParameters: queryParameters},
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.ApiFaliureModel, _i10.ApiSuccessModel>>);

  @override
  _i4.Future<_i2.Either<_i5.ApiFaliureModel, _i10.ApiSuccessModel>> post(
    String? path, {
    Map<String, dynamic>? body = const {},
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [path],
          {#body: body},
        ),
        returnValue: _i4.Future<
                _i2.Either<_i5.ApiFaliureModel, _i10.ApiSuccessModel>>.value(
            _FakeEither_0<_i5.ApiFaliureModel, _i10.ApiSuccessModel>(
          this,
          Invocation.method(
            #post,
            [path],
            {#body: body},
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.ApiFaliureModel, _i10.ApiSuccessModel>>);
}
