import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:snapwall/configs/components/fade_transition_widget.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';

class NetworkCacheImageWithTransitionEffect extends StatelessWidget {
  const NetworkCacheImageWithTransitionEffect(
      {super.key,
      required this.imageUrl,
      this.borderRadius,
      this.fadeTransDelay,
      this.fadeTransAnimate,
      this.placeHolderPeriod});

  final String imageUrl;
  final double? borderRadius;
  final int? fadeTransDelay;
  final int? fadeTransAnimate;
  final int? placeHolderPeriod;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 20.0),
      child: FadeTransitionWidget(
        delay: Duration(milliseconds: fadeTransDelay ?? 200),
        duration: Duration(milliseconds: fadeTransAnimate ?? 1000),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imageUrl,
          placeholder: (context, url) => Shimmer.fromColors(
            period: Duration(milliseconds: placeHolderPeriod ?? 1000),
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: context.mqh * .316,
              decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(borderRadius ?? 20.0),
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
      ),
    );
  }
}
