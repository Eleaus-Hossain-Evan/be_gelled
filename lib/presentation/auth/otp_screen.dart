import 'dart:developer';

import 'package:be_gelled/presentation/auth/login/login.dart';
import 'package:be_gelled/presentation/main_nav/main_nav.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';

import '../../application/auth/auth_provider.dart';
import '../../utils/utils.dart';
import '../widgets/widgets.dart';
import 'signup/signup.dart';

class OTPScreen extends HookConsumerWidget {
  static const route = "/otp";
  const OTPScreen({super.key, required this.isLogin, required this.phone});
  final bool isLogin;
  final String phone;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpController = useTextEditingController();
    final otpFocus = useFocusScopeNode();
    final formKey = useMemoized(GlobalKey.new);

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

    useEffect(() {
      log("OTP Screen $phone");
      return null;
    }, const []);

    final defaultPinTheme = PinTheme(
      width: 65.w,
      height: 64.h,
      textStyle: GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
        color: ColorPalate.harrisonGrey1000,
        letterSpacing: 1.05,
      ),
      decoration: BoxDecoration(
        color: ColorPalate.spaceScape100,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: ColorPalate.spaceScape100,
          width: 1.4,
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: context.color.secondary,
        width: 1.4,
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: ColorPalate.success),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      textStyle: GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
        color: ColorPalate.error,
        letterSpacing: 1.05,
      ),
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(
          color: ColorPalate.error.withOpacity(.6),
          width: 1.4.w,
        ),
        color: ColorPalate.white,
      ),
    );

    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              Gap(104.h),
              Text(
                context.local.otp.toUpperCase(),
                style: CustomTextStyle.textStyle30w700,
              ),
              gap8,
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: context.local.weveSentOneTimePasswordTo,
                      style: CustomTextStyle.textStyle16w400HG900,
                    ),
                    TextSpan(
                      text: "+$phone. ",
                      style: CustomTextStyle.textStyle16w600HG900,
                    ),
                    TextSpan(
                      text: "\n",
                      style: CustomTextStyle.textStyle16w600Orange,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.pop();
                        },
                    ),
                    TextSpan(
                      text: context.local.changeNumber,
                      style: CustomTextStyle.textStyle16w600Orange,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.pop();
                        },
                    ),
                  ],
                ),
              ),
              gap32,
              Align(
                alignment: Alignment.center,
                child: Pinput(
                  controller: otpController,
                  focusNode: otpFocus,
                  defaultPinTheme: defaultPinTheme,
                  followingPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  errorPinTheme: errorPinTheme,
                  // enabled: !isTimerFinished.value,
                  validator: (s) {
                    return s == 1111 ? null : 'Pin is incorrect';
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  errorBuilder: (errorText, pin) => Padding(
                    padding: padding6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          errorText!,
                          style: const TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  onCompleted: (pin) => print(pin),
                ),
              ),
              gap24,
              KFilledButton(
                onPressed: () {
                  context.pop();
                  context.pushReplacement(MainNav.route);
                },
                text:
                    isLogin ? context.local.logIn : context.local.createAccount,
              ),
              gap24,
              Center(
                child: Column(
                  mainAxisAlignment: mainCenter,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: context.local.dontReceiveCode,
                            style: CustomTextStyle.textStyle14w500HG900,
                          ),
                          WidgetSpan(child: gap4),
                          TextSpan(
                            text: context.local.resendCode,
                            style: CustomTextStyle.textStyle14w600Orange,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                log('resend code');
                              },
                          ),
                        ],
                      ),
                    ),
                    gap4,
                    Text(
                      '2m : 00s',
                      style: CustomTextStyle.textStyle16w600HG1000,
                    ),
                  ],
                ),
              ),
              gap24,
              Align(
                alignment: Alignment.center,
                child: Text(
                  isLogin
                      ? context.local.dontHaveAccount
                      : context.local.alreadyHaveAnAccount,
                  style: CustomTextStyle.textStyle16w500HG900,
                ),
              ),
              gap16,
              KOutlinedButton(
                onPressed: () => isLogin
                    ? context.pushReplacement(SignupScreen.route)
                    : context.pushReplacement(LoginScreen.route),
                text:
                    isLogin ? context.local.createAccount : context.local.logIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
