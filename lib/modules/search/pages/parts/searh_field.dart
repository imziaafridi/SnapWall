import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/modules/search/pages/parts/text_style_temp.dart';
import 'package:snapwall/modules/search/s_controller/search_controller.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.searchXController});
  final SearchXContoller searchXController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchXController.textController,
      focusNode: searchXController.focusNode,
      // autofocus: !searchXController.scrollController.hasClients,
      onChanged: (value) {
        searchXController.onSearchTextChanged(value);
      },
      onTap: () {
        searchXController.isFocused.value = !searchXController.isFocused.value;
      },
      decoration: InputDecoration(
        prefixIcon: const Image(
          image: AssetImage('assets/icons/search.png'),
          fit: BoxFit.contain,
          color: AppColors.grey,
        ).paddingAll(12),
        hintText: 'Search Wallpaper ..',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),

        // fillColor: Colors.grey[200],
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.all(
          max(context.mqw * .012, context.mqh * .012),
        ),
      ),
      keyboardType: TextInputType.text,
      style: textStyleTemp,
    );
  }
}
