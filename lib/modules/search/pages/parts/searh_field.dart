import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/modules/search/pages/parts/text_style_temp.dart';
import 'package:snapwall/modules/search/s_controller/search_controller.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.searchXController});
  final SearchXContoller searchXController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        // searchTxtController. .value = value;
        searchXController.onSearchTextChanged(value);
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search',
        border: InputBorder.none,
        fillColor: Colors.grey[200],
        filled: true,
        contentPadding: EdgeInsets.all(
          max(context.mqw * .012, context.mqh * .012),
        ),
      ),
      keyboardType: TextInputType.text,
      style: textStyleTemp,
    );
  }
}
