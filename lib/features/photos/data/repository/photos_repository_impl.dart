import 'package:dartz/dartz.dart';
import 'package:waffaraha_task/core/network/exception/server_exception.dart';
import 'package:waffaraha_task/core/network/models/api_error_model.dart';
import 'package:waffaraha_task/features/photos/data/datesource/photos_remote_datasource.dart';
import 'package:waffaraha_task/features/photos/domain/entity/photo_entity.dart';
import 'package:waffaraha_task/features/photos/domain/repository/photos_repository.dart';

class PhotosRepositoryImpl extends PhotosRepository {
  final PhotosRemoteDataSource _datasource;
  PhotosRepositoryImpl(this._datasource);
  @override
  Future<Either<ApiFaliureModel, List<PhotoEntity>>> getPhotos() async {
    try {
      final result = await _datasource.getPhotos();
      return Right(result);
    } on ServerException catch (faliure) {
      return Left(faliure.errorModel);
    }
  }
}
