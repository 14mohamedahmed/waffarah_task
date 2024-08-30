import 'package:waffaraha_task/features/photos/domain/entity/photo_entity.dart';

class PhoteModel extends PhotoEntity {
  const PhoteModel({
    required super.albumId,
    required super.id,
    required super.title,
    required super.thumbnailUrl,
  });

  factory PhoteModel.fromJson(Map<String, dynamic> json) {
    return PhoteModel(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}
