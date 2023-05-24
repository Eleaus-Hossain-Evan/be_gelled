import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';

class RideOptions extends StatelessWidget {
  const RideOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainSpaceBetween,
      children: [
        _option(
          imagePath: Images.bikeRide,
          title: context.local.rideSharing,
          onTap: () {},
        ),
        _option(
          imagePath: Images.boxDelivery,
          title: context.local.delivery,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _option({
    required String imagePath,
    required String title,
    final VoidCallback? onTap,
  }) {
    return KContainer(
      width: 1.sw / 2.3,
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 48.w,
            height: 48.w,
            fit: BoxFit.cover,
          ),
          gap4,
          Text(
            title,
            style: CustomTextStyle.textStyle16w400HG900,
          ),
        ],
      ),
    );
  }
}
