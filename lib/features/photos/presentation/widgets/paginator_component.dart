import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waffaraha_task/core/utils/app_colors.dart';
import 'package:waffaraha_task/core/utils/enums.dart';
import 'package:waffaraha_task/features/photos/presentation/controller/photos_bloc.dart';

class PaginatorComponent extends StatelessWidget {
  const PaginatorComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotosBloc, PhotosState>(
      buildWhen: (previous, current) =>
          current.getPhotosState == RequestStatus.success,
      builder: (context, state) {
        return Visibility(
          visible: state.photos.isNotEmpty,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 0.2,
                  offset: Offset(0, 1),
                  color: Colors.black,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    BlocProvider.of<PhotosBloc>(context)
                        .add(OnChangePageEvent(state.currentPage - 1));
                  },
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 12,
                      ),
                      children: [
                        const TextSpan(
                          text: "Page ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor,
                          ),
                        ),
                        TextSpan(
                          text: state.currentPage.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const TextSpan(
                          text: " of ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor,
                          ),
                        ),
                        TextSpan(
                          text:
                              "${state.photos.length ~/ context.read<PhotosBloc>().itemPerPage}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    BlocProvider.of<PhotosBloc>(context)
                        .add(OnChangePageEvent(state.currentPage + 1));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
