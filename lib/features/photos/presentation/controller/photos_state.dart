part of 'photos_bloc.dart';

class PhotosState extends Equatable {
  const PhotosState({
    this.getPhotosState = RequestStatus.initial,
    this.photos = const [],
    this.currentPage = 1,
    this.currentPagePhotos = const [],
    this.filiterByAlbumId = 0,
    this.soryBy = SortBy.none,
  });
  final RequestStatus getPhotosState;
  // * Total Returned Photos from Server
  final List<PhotoEntity> photos;
  // * Photos Will be displayed per page
  final List<PhotoEntity> currentPagePhotos;
  final int currentPage;
  final SortBy soryBy;
  final int filiterByAlbumId;

  PhotosState copyWith({
    RequestStatus? getPhotosState,
    List<PhotoEntity>? photos,
    int? currentPage,
    List<PhotoEntity>? currentPagePhotos,
    RequestStatus? onChangeActionsState,
    SortBy? soryBy,
    int? filiterByAlbumId,
  }) {
    return PhotosState(
      getPhotosState: getPhotosState ?? this.getPhotosState,
      photos: photos ?? this.photos,
      currentPage: currentPage ?? this.currentPage,
      currentPagePhotos: currentPagePhotos ?? this.currentPagePhotos,
      filiterByAlbumId: filiterByAlbumId ?? this.filiterByAlbumId,
      soryBy: soryBy ?? this.soryBy,
    );
  }

  @override
  List<Object> get props => [
        getPhotosState,
        photos,
        currentPage,
        currentPagePhotos,
        filiterByAlbumId,
        soryBy,
      ];
}
