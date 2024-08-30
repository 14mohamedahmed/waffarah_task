part of 'photos_bloc.dart';

class PhotosState extends Equatable {
  const PhotosState({
    this.getPhotosState = RequestStatus.initial,
    this.photos = const [],
    this.currentPage = 1,
    this.currentPagePhotos = const [],
  });
  final RequestStatus getPhotosState;
  final List<PhotoEntity> photos;
  final List<PhotoEntity> currentPagePhotos;
  final int currentPage;

  PhotosState copyWith({
    RequestStatus? getPhotosState,
    List<PhotoEntity>? photos,
    int? currentPage,
    List<PhotoEntity>? currentPagePhotos,
  }) {
    return PhotosState(
      getPhotosState: getPhotosState ?? this.getPhotosState,
      photos: photos ?? this.photos,
      currentPage: currentPage ?? this.currentPage,
      currentPagePhotos: currentPagePhotos ?? this.currentPagePhotos,
    );
  }

  @override
  List<Object> get props =>
      [getPhotosState, photos, currentPage, currentPagePhotos];
}
