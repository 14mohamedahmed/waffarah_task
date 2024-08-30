import 'package:dartz/dartz.dart';
import 'package:waffaraha_task/core/network/models/api_error_model.dart';
import 'package:waffaraha_task/features/photos/domain/entity/photo_entity.dart';

abstract class PhotosRepository {
  Future<Either<ApiFaliureModel, List<PhotoEntity>>> getPhotos();
}
