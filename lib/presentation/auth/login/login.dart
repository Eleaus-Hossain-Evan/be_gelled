import 'package:be_gelled/presentation/widgets/button.dart';
import 'package:be_gelled/presentation/widgets/k_inkwell.dart';
import 'package:be_gelled/presentation/widgets/k_text_button.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:country_code_picker/country_code_picker.dart';

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
    final phonefocus = useFocusNode();
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

    final isSelected = useState(false);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Gap(104.h),
            Text(
              'Log In'.toTitleCase(),
              style: CustomTextStyle.textStyle30w700,
            ),
            gap8,
            Text(
              "Enter your registered phone number to login your account.",
              style: CustomTextStyle.textStyle16w400HG900,
            ),
            gap32,
            Container(
              decoration: BoxDecoration(
                color: ColorPalate.spaceScape100,
                borderRadius: radius8,
                border: phonefocus.hasFocus
                    ? Border.all(
                        color: ColorPalate.harrisonGrey1000,
                        width: 1,
                      )
                    : null,
              ),
              child: GestureDetector(
                onTap: () {
                  isSelected.value = true;
                },
                child: TextFormField(
                  controller: phoneController,
                  focusNode: phonefocus,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    labelStyle: CustomTextStyle.textStyle16w400HG900,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
            ),
            gap24,
            KFilledButton(
              onPressed: () {},
              text: 'Send Code',
            ),
            // FilledButton(
            //   onPressed: () {},
            //   child: Text('Login with Google'),
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text('Login with Facebook'),
            // ),
            // OutlinedButton(
            //   onPressed: () {},
            //   child: Text('Login with Apple'),
            // ),
            gap24,
            Row(
              mainAxisAlignment: mainSpaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text('Remember'),
                  ],
                ),
                Flexible(
                  child: KInkWell(
                    // style: ButtonStyle(
                    //   padding: MaterialStateProperty.all(EdgeInsets.zero),
                    // ),
                    child: Text('Forgot Password?'),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            gap24,
            TextButton(onPressed: () {}, child: Text('Don’t have account?')),
            gap16,
            KOutlinedButton(
              onPressed: () {},
              text: 'Create Account',
            ),
          ],
        ),
      ),
    );
  }
}
