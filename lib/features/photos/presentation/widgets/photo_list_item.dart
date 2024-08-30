import 'package:flutter/material.dart';
import 'package:waffaraha_task/components/packages/cashed_image/image_network_cashed.dart';
import 'package:waffaraha_task/core/utils/app_colors.dart';
import 'package:waffaraha_task/features/photos/domain/entity/photo_entity.dart';

class PhotoListItem extends StatelessWidget {
  const PhotoListItem(this.photoEntity, {super.key});
  final PhotoEntity photoEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border.all(
              color: AppColors.lightGrey,
            ),
          ),
          child: ImageNetworkCashed(photoEntity.thumbnailUrl),
        ),
        const SizedBox(height: 8),
        Text(
          photoEntity.title,
          style: const TextStyle(
            color: AppColors.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Text(
          "Album id: ${photoEntity.albumId}",
          style: const TextStyle(
            color: AppColors.textColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
