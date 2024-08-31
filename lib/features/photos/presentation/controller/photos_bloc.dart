import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waffaraha_task/core/utils/enums.dart';
import 'package:waffaraha_task/features/photos/domain/entity/photo_entity.dart';
import 'package:waffaraha_task/features/photos/domain/usecase/get_photos_usecase.dart';

part 'photos_event.dart';
part 'photos_state.dart';

enum SortBy { none, title, albumId }

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final GetPhotosUsecase _getPhotosUsecase;
  PhotosBloc(this._getPhotosUsecase) : super(const PhotosState()) {
    on<GetPhotosEvent>(_getPhotosHandler);
    on<OnChangePageEvent>(_onChangePageHandler);
    on<OnApplyPhotosFilterAndSortEvent>(_onApplyPhotosActionsHandler);
    on<OnChangeSortByTitle>(_onChangeSortByTitle);
    on<OnChangeSortByAlbumId>(_onChangeSortByAlbumId);
    on<OnChangeFiliterByAlbumId>(_onChangeFiliterByAlbumId);
  }

  final int itemPerPage = 10;
  Set<int> albumIds = <int>{};

  _getPhotosHandler(GetPhotosEvent event, Emitter<PhotosState> emit) async {
    emit(state.copyWith(getPhotosState: RequestStatus.loading));
    final result = await _getPhotosUsecase.call();
    result.fold(
      (failure) => emit(state.copyWith(
        getPhotosState: RequestStatus.failure,
      )),
      (photos) {
        emit(
          state.copyWith(
            getPhotosState: RequestStatus.success,
            photos: photos,
            currentPagePhotos: _getCurrentPagePhotos(photos),
          ),
        );
        albumIds = photos.map((e) => e.albumId).toSet();
      },
    );
  }

  List<PhotoEntity> _getCurrentPagePhotos(List<PhotoEntity> photos) {
    // remove 1 from current page if current page is 1 because we need to get the list from index 0 not index 10
    final startIndex = (state.currentPage - 1) * itemPerPage;
    final endIndex = (state.currentPage) * itemPerPage;
    return photos.sublist(startIndex, endIndex);
  }

  _onChangePageHandler(OnChangePageEvent event, Emitter<PhotosState> emit) {
    // this line to avoid make current page to 0 if it is 1
    if (state.currentPage == 1 && event.page == 0) return;
    final photos = getPhotosAfterFiliteration();
    // this line to avoid make current page larger than total pages
    if ((photos.length ~/ itemPerPage) < event.page) return;
    emit(state.copyWith(currentPage: event.page));
    emit(state.copyWith(currentPagePhotos: _getCurrentPagePhotos(photos)));
  }

  _onApplyPhotosActionsHandler(
      OnApplyPhotosFilterAndSortEvent event, Emitter<PhotosState> emit) {
    emit(state.copyWith(getPhotosState: RequestStatus.loading, currentPage: 1));
    final photos = getPhotosAfterFiliteration();
    emit(state.copyWith(
      getPhotosState: RequestStatus.success,
      currentPagePhotos: _getCurrentPagePhotos(photos),
    ));
  }

  _onChangeSortByTitle(OnChangeSortByTitle event, Emitter<PhotosState> emit) {
    emit(state.copyWith(soryBy: SortBy.title));
  }

  _onChangeSortByAlbumId(
      OnChangeSortByAlbumId event, Emitter<PhotosState> emit) {
    emit(state.copyWith(soryBy: SortBy.albumId));
  }

  _onChangeFiliterByAlbumId(
      OnChangeFiliterByAlbumId event, Emitter<PhotosState> emit) {
    emit(state.copyWith(filiterByAlbumId: event.id));
  }

  List<PhotoEntity> getPhotosAfterFiliteration() {
    List<PhotoEntity> photos = state.photos;
    if (state.soryBy == SortBy.title) {
      photos.sort((a, b) => a.title.compareTo(b.title));
    }
    if (state.soryBy == SortBy.albumId) {
      photos.sort((a, b) => a.albumId.compareTo(b.albumId));
    }
    if (state.filiterByAlbumId != 0) {
      photos = photos
          .where((element) => element.albumId == state.filiterByAlbumId)
          .toList();
    }
    return photos;
  }
}
