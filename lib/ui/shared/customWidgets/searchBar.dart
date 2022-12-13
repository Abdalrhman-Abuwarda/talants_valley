import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/colorsManager.dart';
import '../../../resources/valuesManager.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(Icons.search),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide:
            const BorderSide(color: ColorManager.mainBorderColor)),
      ),
    );
  }
}
