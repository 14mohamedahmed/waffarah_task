import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:waffaraha_task/features/photos/data/model/phote_model.dart';
import 'package:waffaraha_task/features/photos/domain/entity/photo_entity.dart';

import '../../../helper/json_reader_test.dart';

void main() {
  PhoteModel photeModel = const PhoteModel(
      albumId: 1,
      id: 1,
      title: "accusamus beatae ad facilis cum similique qui sunt",
      thumbnailUrl: "https://via.placeholder.com/150/92c952");

  test('PhotoModel should be a subclass of PhoteEntity', () {
    expect(photeModel, isA<PhotoEntity>());
  });

  test('should parse json to be PhotoModel', () {
    final List data = json.decode(
      readJson('helper/dummy_data_test.json'),
    );

    final result = data.map((e) => PhoteModel.fromJson(e)).toList();

    expect(result, [photeModel]);
  });
}
