import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/values_manager.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    required this.sheetPage,
    Key? key,
  }) : super(key: key);

  final Widget Function(BuildContext) sheetPage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s40.h,
      child: Stack(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: ColorManager.unselectedAppBarColor ),
              hintText: "Search",
              prefixIcon: const Icon(Icons.search , color: ColorManager.unselectedAppBarColor,),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.r),
                  borderSide:
                  const BorderSide(color: ColorManager.mainBorderColor)),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () => showModalBottomSheet(
                  isScrollControlled: false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(23.r),
                        topRight: Radius.circular(23.r)),
                  ),
                  context: context,
                  builder: sheetPage,),
                child: SvgPicture.asset(
                  IconAssets.filterIcon,
                  color: ColorManager.unselectedAppBarColor,
                  height: AppSize.s16.h,
                  width: AppSize.s16.w,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
