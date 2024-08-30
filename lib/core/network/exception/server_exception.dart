import 'package:waffaraha_task/core/network/models/api_error_model.dart';

class ServerException implements Exception {
  final ApiFaliureModel errorModel;

  const ServerException({
    required this.errorModel,
  });
}
