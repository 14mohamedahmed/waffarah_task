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

class SortPhotosEvent extends PhotosEvent {}

class FiliterPhotosEvent extends PhotosEvent {}
