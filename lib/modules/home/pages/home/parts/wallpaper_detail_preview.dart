import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/back_widget.dart';
import 'package:snapwall/configs/components/glass_morphism.dart';
import 'package:snapwall/configs/components/heading_text_widget.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/modules/home/models/trend_photos_model.dart';

class SnapWallWallpaperDetailPreview extends StatelessWidget {
  const SnapWallWallpaperDetailPreview({
    super.key,
    required this.photosModel,
  });

  final PhotosModel photosModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        _buildHeading(),
        _buildPhotoView(),
        _buildGlassMorphismButton(context),
      ],
    );
  }

  Widget _buildHeading() {
    return const HeadingTextWidget(title: 'Preview');
  }

  Widget _buildPhotoView() {
    return PhotoView(
      imageProvider: CachedNetworkImageProvider(photosModel.src.portrait),
      loadingBuilder: (context, event) => _buildLoadingIndicator(event),
      backgroundDecoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      minScale: PhotoViewComputedScale.covered,
      maxScale: PhotoViewComputedScale.covered * 1.5,
      initialScale: PhotoViewComputedScale.covered,
      enableRotation: true,
    );
  }

  Widget _buildLoadingIndicator(ImageChunkEvent? event) {
    return Center(
      child: CircularProgressIndicator(
        value: event == null
            ? 0
            : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
      ),
    );
  }

  Widget _buildGlassMorphismButton(BuildContext context) {
    final double bottomPadding = context.mqh * 0.04;
    final double horizontalPadding = context.mqw * 0.44;

    return Positioned(
      bottom: bottomPadding,
      left: horizontalPadding,
      right: horizontalPadding,
      child: const GlassMorphism(
        blur: 2,
        opacity: 0.16,
        child: BackWidget(
          icon: Icons.close_outlined,
          color: AppColors.red,
        ),
      ),
    );
  }
}
