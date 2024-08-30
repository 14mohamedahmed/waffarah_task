import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waffaraha_task/core/utils/app_colors.dart';

class ImageNetworkCashed extends StatelessWidget {
  const ImageNetworkCashed(this.url, {super.key});
  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: AppColors.purple,
        ),
      ),
      fit: BoxFit.contain,
      errorWidget: (context, url, error) => const Icon(
        Icons.error_outline,
        color: Colors.red,
      ),
    );
  }
}
