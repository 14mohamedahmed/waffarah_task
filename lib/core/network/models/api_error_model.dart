import 'package:equatable/equatable.dart';

class ApiFaliureModel extends Equatable {
  final int status;
  final String message;

  const ApiFaliureModel({
    required this.status,
    required this.message,
  });

  // this format is provided from API documentation and can be changed
  factory ApiFaliureModel.fromJson(Map<String, dynamic> json) =>
      ApiFaliureModel(
        status: json["status"] ?? 0,
        message: json["message"] ?? "",
      );

  @override
  List<Object> get props => [status, message];
}
