import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waffaraha_task/components/custom/action_button.dart';
import 'package:waffaraha_task/core/services/navigation_service.dart';
import 'package:waffaraha_task/core/services/services_locator.dart';
import 'package:waffaraha_task/core/utils/app_colors.dart';
import 'package:waffaraha_task/features/photos/presentation/controller/photos_bloc.dart';
import 'package:waffaraha_task/features/photos/presentation/widgets/sort_filiter_sheet/sort_item.dart';

showSortAndFiliterFormSheet(
    {required BuildContext context, required PhotosBloc bloc}) async {
  return await showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    isDismissible: false,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (context) => BlocProvider.value(
      value: bloc,
      child: const _SortFiliterBottomSheet(),
    ),
  );
}

class _SortFiliterBottomSheet extends StatelessWidget {
  const _SortFiliterBottomSheet();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 15, end: 8),
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Photos Actions",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor,
                ),
              ),
              CloseButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppColors.grey2),
                ),
              ),
            ],
          ),
          const Divider(color: AppColors.grey2),
          const SizedBox(height: 10),
          const Text(
            "Sort By",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
          ),
          BlocBuilder<PhotosBloc, PhotosState>(
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: SortItem(
                      isMarked: state.soryBy,
                      radioValue: SortBy.title,
                      title: "Photo title",
                      onChange: (value) {
                        context
                            .read<PhotosBloc>()
                            .add(OnChangeSortByTitle(value));
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SortItem(
                      isMarked: state.soryBy,
                      radioValue: SortBy.albumId,
                      title: "Album id",
                      onChange: (value) {
                        context.read<PhotosBloc>().add(
                              OnChangeSortByAlbumId(value),
                            );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 50),
          ActionButton(
            text: "Apply",
            onPressed: () {
              context.read<PhotosBloc>().add(OnApplyPhotosFilterAndSortEvent());
              getIt<NavigationService>().goBack();
            },
            borderRadius: 8,
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
