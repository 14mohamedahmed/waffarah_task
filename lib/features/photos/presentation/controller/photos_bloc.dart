import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waffaraha_task/core/utils/enums.dart';
import 'package:waffaraha_task/features/photos/domain/entity/photo_entity.dart';
import 'package:waffaraha_task/features/photos/domain/usecase/get_photos_usecase.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final GetPhotosUsecase _getPhotosUsecase;
  PhotosBloc(this._getPhotosUsecase) : super(const PhotosState()) {
    on<GetPhotosEvent>(_getPhotosHandler);
    on<OnChangePageEvent>(_onChangePageHandler);
  }

  final int itemPerPage = 10;

  _getPhotosHandler(GetPhotosEvent event, Emitter<PhotosState> emit) async {
    emit(state.copyWith(getPhotosState: RequestStatus.loading));
    final result = await _getPhotosUsecase.call();
    result.fold(
      (failure) => emit(state.copyWith(
        getPhotosState: RequestStatus.failure,
      )),
      (photos) => emit(state.copyWith(
        getPhotosState: RequestStatus.success,
        photos: photos,
        currentPagePhotos: _getCurrentPagePhotos(photos),
      )),
    );
  }

  List<PhotoEntity> _getCurrentPagePhotos(List<PhotoEntity> photos) {
    final startIndex = state.currentPage * itemPerPage;
    final endIndex = (state.currentPage + 1) * itemPerPage;
    return photos.sublist(startIndex, endIndex);
  }

  _onChangePageHandler(OnChangePageEvent event, Emitter<PhotosState> emit) {
    if (state.currentPage == 1 && event.page == 0) return;
    emit(state.copyWith(
      currentPage: event.page,
      currentPagePhotos: _getCurrentPagePhotos(state.photos),
    ));
  }
}
