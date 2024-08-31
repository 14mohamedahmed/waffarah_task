import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waffaraha_task/components/packages/lottie_animations/lottie_animations.dart';
import 'package:waffaraha_task/features/photos/presentation/controller/photos_bloc.dart';
import 'package:waffaraha_task/features/photos/presentation/widgets/paginator_component.dart';
import 'package:waffaraha_task/features/photos/presentation/widgets/photos_list_view.dart';
import 'package:waffaraha_task/features/photos/presentation/widgets/sort_filiter_sheet/sort_filiter_bottom_sheet.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
        actions: [
          IconButton(
            icon: const LottieAnimations(
              type: LottieAnimationsType.asset,
              path: "assets/lottie/sort_filiter.json",
            ),
            onPressed: () {
              showSortAndFiliterFormSheet(
                context: context,
                bloc: context.read<PhotosBloc>(),
              );
            },
          )
        ],
      ),
      body: const Column(
        children: [
          PhotosListView(),
          PaginatorComponent(),
        ],
      ),
    );
  }
}
