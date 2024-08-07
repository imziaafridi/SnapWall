import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:snapwall/configs/components/loading_widget.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/modules/home/pages/home/parts/network_cache_image.dart';
import 'package:snapwall/modules/search/models/search_photos_model.dart';
import 'package:snapwall/modules/search/s_controller/search_controller.dart';

class SearchedPhotosGrid extends StatelessWidget {
  final List<PhotosDetailsSearchModel> data;
  final SearchXContoller searchXController;

  const SearchedPhotosGrid(
      {super.key, required this.data, required this.searchXController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MasonryGridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: data.length + (searchXController.loadMore.value ? 1 : 0),
          mainAxisSpacing: context.mqw * .02,
          crossAxisSpacing: context.mqh * .014,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            if (index < data.length) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                child: NetworkCacheImageWithTransitionEffect(
                  imageUrl: data[index].src.portrait,
                ),
              );
            } else {
              return const Center(child: LoadingWidget());
            }
          },
        ),
      ],
    );
  }
}
