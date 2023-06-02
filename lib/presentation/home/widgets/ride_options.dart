import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/auth/loggedin_provider.dart';
import '../../../utils/utils.dart';
import '../../auth/login/login.dart';
import '../../auth/otp_screen.dart';
import '../../auth/signup/signup.dart';
import '../../widgets/widgets.dart';
import 'add_familuy_member.dart';

class RideOptions extends HookConsumerWidget {
  const RideOptions({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
      width: 1.sw,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: mainMin,
          children: [
            _option(
              imagePath: Images.healthyFood,
              title: context.local.healthyFood,
              onTap: () {
                showCustomSheet(
                  context: context,
                  builder: (context) {
                    return ref.watch(loggedInProvider).loggedIn
                        ? const AddFamilyMember()
                        : LoginScreen(
                            onPressedSend: (number) {
                              Navigator.pop(context);
                              context.push(
                                  "${OTPScreen.route}/Login?number=$number");
                            },
                            onPressedSignUp: () =>
                                context.pushReplacement(SignupScreen.route),
                          );
                  },
                );
              },
            ),
            gap16,
            _option(
              imagePath: Images.bikeRide,
              title: context.local.rideSharing,
              onTap: () {},
            ),
            gap16,
            _option(
              imagePath: Images.boxDelivery,
              title: context.local.delivery,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _option({
    required String imagePath,
    required String title,
    final VoidCallback? onTap,
  }) {
    return KContainer(
      width: 1.sw / 2.6,
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
