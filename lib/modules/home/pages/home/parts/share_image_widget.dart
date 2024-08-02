// import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:snapwall/configs/color/color.dart';

// class ShareImageWidget extends StatelessWidget {
//   const ShareImageWidget({
//     super.key,
//     required this.imagePath,
//   });
//   final String imagePath;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => _shareImage(imagePath),
//       child: const Image(
//         image: AssetImage('assets/icons/share.png'),
//         height: 25,
//         color: AppColors.black,
//       ),
//     );
//   }

// // Method to handle the image sharing
//   void _shareImage(String imagePath) async {
//     final XFile file = XFile(imagePath);
//     final List<XFile> files = [file];
//     final ShareResult result = await Share.shareXFiles(
//       files,
//       subject: 'Image Share',
//       text: 'Check out this awesome image!',
//     );
//     if (result.status == ShareResultStatus.success) {
//       debugPrint('Image shared successfully');
//     } else {
//       debugPrint('Error sharing image');
//     }
//   }
// }
