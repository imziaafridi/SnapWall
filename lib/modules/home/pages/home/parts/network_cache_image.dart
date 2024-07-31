import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NetworkCacheImage extends StatelessWidget {
  const NetworkCacheImage(
      {super.key, required this.imageUrl, this.borderRadius});

  final String imageUrl;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (context, url) => Shimmer.fromColors(
          period: const Duration(seconds: 1),
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  blurRadius: 5,
                  spreadRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            // child: ,
          ),
        ),
        errorWidget: (context, url, error) => const Center(
          child: Icon(Icons.error),
        ),
      ),
    );
  }
}
