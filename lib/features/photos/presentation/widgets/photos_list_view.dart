import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waffaraha_task/core/utils/enums.dart';
import 'package:waffaraha_task/features/photos/presentation/controller/photos_bloc.dart';
import 'package:waffaraha_task/features/photos/presentation/widgets/photo_list_item.dart';

class PhotosListView extends StatelessWidget {
  const PhotosListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PhotosBloc, PhotosState>(
        builder: (context, state) {
          if (state.getPhotosState == RequestStatus.loading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state.getPhotosState == RequestStatus.failure) {
            return Center(
              child: Text(state.getPhotosState.toString()),
            );
          } else {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              itemCount: state.currentPagePhotos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 250,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (_, index) => PhotoListItem(
                state.currentPagePhotos[index],
              ),
            );
          }
        },
      ),
    );
  }
}
