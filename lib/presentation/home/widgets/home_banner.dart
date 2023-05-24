import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/utils.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            Images.banner,
            height: 140.h,
            fit: BoxFit.fill,
          );
        },
        autoplay: true,
        itemCount: 3,
        pagination: SwiperPagination(
          margin: paddingBottom8,
          builder: DotSwiperPaginationBuilder(
            activeColor: ColorPalate.white,
            color: ColorPalate.white.withOpacity(0.32),
            space: 6.w,
          ),
        ),
      ),
    );
  }
}
