import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/auth/auth_provider.dart';
import '../../../utils/utils.dart';
import '../../main_nav/main_nav.dart';
import 'widgets/check_otp.dart';
import 'widgets/get_otp.dart';

class LoginScreen extends HookConsumerWidget {
  static String route = "/login";
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = useTextEditingController();
    final phone = useState(phoneController.text);
    final otpController = useTextEditingController();
    final time = useState(120);

    final pageViewController = usePageController();

    navigateToHome() {
      context.go(MainNav.route);
    }

    ref.listen(
      authProvider,
      (previous, next) {
        if (previous!.loading == true && next.loading == false) {
          BotToast.closeAllLoading();
        } else {
          BotToast.showLoading();
        }
      },
    );

    return Scaffold(
      backgroundColor: ColorPalate.white2,
      appBar: AppBar(
        backgroundColor: ColorPalate.white2,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Text(
              "context.local.login.toTitleCase()",
              style: CustomTextStyle.textStyle32w600,
            ),
            gap20,
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
              child: Text(
                "context.local.loginBelowText",
                style: context.bodyMedium.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: ColorPalate.black3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
