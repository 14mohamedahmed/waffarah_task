import 'package:dartz/dartz.dart';
import 'package:waffaraha_task/core/network/models/api_error_model.dart';
import 'package:waffaraha_task/core/network/models/api_success_model.dart';

abstract class ApiService {
  Future<Either<ApiFaliureModel, ApiSuccessModel>> get(
    String path, {
    Map<String, dynamic> queryParameters = const {},
  });

  Future<Either<ApiFaliureModel, ApiSuccessModel>> post(
    String path, {
    Map<String, dynamic> body = const {},
  });

  // .... We can add other methods to call APIs like Post, Update, Delete....
}
