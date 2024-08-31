part of 'photos_bloc.dart';

sealed class PhotosEvent extends Equatable {
  const PhotosEvent();

  @override
  List<Object> get props => [];
}

class GetPhotosEvent extends PhotosEvent {}

class OnChangePageEvent extends PhotosEvent {
  final int page;

  const OnChangePageEvent(this.page);
}

class OnChangeSortByTitle extends PhotosEvent {
  final SortBy value;
  const OnChangeSortByTitle(this.value);
}

class OnChangeSortByAlbumId extends PhotosEvent {
  final SortBy value;
  const OnChangeSortByAlbumId(this.value);
}

class OnChangeFiliterByAlbumId extends PhotosEvent {
  final int id;
  const OnChangeFiliterByAlbumId(this.id);
}

class OnApplyPhotosFilterAndSortEvent extends PhotosEvent {}
