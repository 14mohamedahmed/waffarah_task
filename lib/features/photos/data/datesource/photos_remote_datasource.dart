import 'package:waffaraha_task/core/network/api_constants.dart';
import 'package:waffaraha_task/core/network/exception/server_exception.dart';
import 'package:waffaraha_task/core/network/network_provider/api_services.dart';
import 'package:waffaraha_task/features/photos/data/model/phote_model.dart';

abstract class PhotosRemoteDataSource {
  Future<List<PhoteModel>> getPhotos();
}

class PhotosRemoteDataSourceImpl implements PhotosRemoteDataSource {
  final ApiService apiService;
  PhotosRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<PhoteModel>> getPhotos() async {
    final response = await apiService.get(ApiConstants.photos);
    // If there an error, dio interceptor will handle it and display needed message based on return response
    // In current case, Errors handeled but this will not happen with current fake API
    return response.fold(
      (l) => throw ServerException(errorModel: l),
      (result) {
        // We can call [ShowToastMessages.showMessage(r.data['message'])] here to display the success message
        return (result.data as List)
            .map((e) => PhoteModel.fromJson(e))
            .toList();
      },
    );
  }
}
