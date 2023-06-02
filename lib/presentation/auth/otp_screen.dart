import 'dart:async';
import 'dart:developer';

import 'package:be_gelled/presentation/auth/login/login.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';

import '../../application/auth/auth_provider.dart';
import '../../domain/auth/login_body.dart';
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
    const totalSec = 60;
    final otpController = useTextEditingController();
    final otpFocus = useFocusScopeNode();
    final formKey = useMemoized(GlobalKey.new);

    final hasError = useState(false);

    late Timer timer;
    final start = useState(totalSec);
    final myDuration = Duration(seconds: start.value);
    void startTimer() {
      const oneSec = Duration(seconds: 1);
      timer = Timer.periodic(
        oneSec,
        (Timer timer) {
          if (start.value == 0) {
            timer.cancel();
          } else {
            start.value--;
          }
        },
      );
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

    useEffect(() {
      log("OTP Screen $phone");

      startTimer();

      return () {
        start.dispose();
        timer.cancel();
      };
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

    String strDigits(int n) => n.toString().padLeft(2, '0');
    // final days = strDigits(myDuration.inDays);
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              gap32,
              Text(
                context.local.otp.toUpperCase(),
                style: CustomTextStyle.textStyle30w700,
              ),
              gap16,
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
                  enabled: start.value != 0,
                  // validator: (s) {
                  //   return hasError.value ? 'Pin is incorrect' : null;
                  // },
                  forceErrorState: hasError.value,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  // errorBuilder: (errorText, pin) => Padding(
                  //   padding: padding6,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         errorText!,
                  //         style: const TextStyle(),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  onCompleted: (pin) => Logger.i(pin),
                ),
              ),
              gap24,
              KFilledButton(
                onPressed: start.value != 0
                    ? () async {
                        // if (!isLogin) context.pop();
                        // context.pushReplacement(MainNav.route);
                        // ref
                        //     .read(loggedInProvider.notifier)
                        //     .updateAuthCache(token: "token");

                        final success = await ref
                            .read(authProvider.notifier)
                            .loginCheckOtp(LoginOtpBody(
                                otp: otpController.text, phone: phone));
                        if (!success) {
                          hasError.value = true;
                        }
                      }
                    : null,
                text:
                    isLogin ? context.local.logIn : context.local.createAccount,
              ),
              gap24,
              Center(
                child: Column(
                  mainAxisAlignment: mainCenter,
                  children: [
                    Row(
                      mainAxisAlignment: mainCenter,
                      children: [
                        Text(
                          context.local.dontReceiveCode,
                          style: CustomTextStyle.textStyle14w500HG900,
                        ),
                        gap4,
                        SizedBox(
                          width: 120.w,
                          height: 34.h,
                          child: TextButton(
                            onPressed: () async {
                              final success = await ref
                                  .read(authProvider.notifier)
                                  .loginGetOtp(LoginBody(phone: phone));

                              if (success) {
                                hasError.value = false;
                                start.value = totalSec;
                                startTimer();
                              }
                            },
                            child: Text(
                              context.local.resendCode,
                              style: start.value != 0
                                  ? CustomTextStyle.textStyle14w600
                                  : CustomTextStyle.textStyle14w600Orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                    gap6,
                    Text(
                      start.value != 0
                          ? '$hours : $minutes : $seconds'
                          : 'Time Expired',
                      style: CustomTextStyle.textStyle16w600HG1000.copyWith(
                        color: start.value != 0 ? ColorPalate.primary : null,
                      ),
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
