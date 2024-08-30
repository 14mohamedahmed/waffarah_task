import 'package:flutter/material.dart';
import 'package:waffaraha_task/features/photos/presentation/widgets/paginator_component.dart';
import 'package:waffaraha_task/features/photos/presentation/widgets/photos_list_view.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          PhotosListView(),
          PaginatorComponent(),
        ],
      ),
    );
  }
}
