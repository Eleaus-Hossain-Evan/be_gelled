import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';

import '../../../../application/auth/auth_provider.dart';
import '../../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

typedef ResendPressed = void Function();
typedef ChangeNumberPressed = void Function();
typedef CheckOtpPressed = void Function();

class CheckOtpWidget extends HookConsumerWidget {
  const CheckOtpWidget({
    Key? key,
    required this.phone,
    required this.changeNumber,
    required this.resendPressed,
    required this.checkOtpPressed,
    required this.otpController,
    required this.time,
    // required CountdownController controller,
  }) : super(key: key);

  final ValueNotifier<String> phone;
  final ChangeNumberPressed changeNumber;
  final ResendPressed resendPressed;
  final CheckOtpPressed checkOtpPressed;
  final TextEditingController otpController;
  final ValueNotifier<int> time;
  // final CountdownController _controller;

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(authProvider);

    // final isTimerFinished = useState(
    // _controller.isCompleted != null && _controller.isCompleted == false);

    final defaultPinTheme = PinTheme(
      width: 48,
      height: 48,
      textStyle: GoogleFonts.openSans(
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
        color: ColorPalate.black,
        letterSpacing: 1.2,
      ),
      decoration: BoxDecoration(
        color: ColorPalate.white,
        // border: Border.all(color: ColorPalate.grey3),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: context.color.secondary,
        width: 1.4,
      ),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: ColorPalate.success),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(
          color: context.color.error.withOpacity(.4),
          width: 1.4,
        ),
        color: context.color.primary.withOpacity(.04),
      ),
    );

    useEffect(() {
      // _controller.start();
      // _controller.setOnRestart(() {
      //   isTimerFinished.value = false;
      // });

      return () {
        // _controller.pause();
      };
    }, []);

    return Material(
      child: SingleChildScrollView(
        padding: EdgeInsetsDirectional.fromSTEB(20.w, 0, 20.w, 0),
        child: Column(
          children: [
            gap36,
            Text(
              "context.local.otpVerification",
              style: TextStyle(),
            ),
            gap10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "context.local.enterTheOTPSentTo",
                  style: TextStyle(),
                ),
                gap6,
                Text(
                  phone.value,
                  style: TextStyle(),
                ),
              ],
            ),
            gap20,
            Pinput(
              controller: otpController,
              defaultPinTheme: defaultPinTheme,
              followingPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              errorPinTheme: errorPinTheme,
              // enabled: !isTimerFinished.value,
              // validator: (s) {
              //   return s == otp.value.toString() ? null : 'Pin is incorrect';
              // },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              errorBuilder: (errorText, pin) => Padding(
                padding: padding6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      errorText!,
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
              onCompleted: (pin) => print(pin),
            ),
            gap8,
            // Countdown(
            //   seconds: time.value,
            //   controller: _controller,
            //   build: (_, double time) {
            //     final text = isTimerFinished.value
            //         ? context.local.timeExpired
            //         : "${(time / 60).floor()}:${(time % 60).floor()}";
            // return
            Text(
              "text",
              style: TextStyle(),
            ),
            // ;
            // },
            //   interval: const Duration(seconds: 1),
            //   onFinished: () {
            //     isTimerFinished.value = true;
            //   },
            // ),
            gap12,
            // isTimerFinished.value
            //     ? Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text(
            //             context.local.didntReceiveTheCode,
            //             style: context.caption.copyWith(
            //               fontSize: 15.sp,
            //               color: ColorPalate.caption,
            //             ),
            //           ),
            //           SizedBox(
            //             width: 75.w,
            //             height: 40.h,
            //             child: TextButton(
            //               onPressed: () {
            //                 isTimerFinished.value = false;
            //                 otpController.clear();
            //                 resendPressed.call();
            //               },
            //               child: Text(
            //                 context.local.resend,
            //                 style: context.caption.copyWith(
            //                   fontWeight: FontWeight.w600,
            //                   fontSize: 15.sp,
            //                   color: ColorPalate.black1,
            //                   decoration: TextDecoration.underline,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       )
            //     : const SizedBox.shrink(),
            gap4,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.w),
              child: KElevatedButton(
                onPressed:
                    // isTimerFinished.value ? null :
                    checkOtpPressed,
                text: "context.local.checkOTP",
                isSecondary: true,
              ),
            ),
            Gap(30.h),
            TextButton.icon(
              icon: const Icon(
                Icons.arrow_back,
                color: ColorPalate.secondary,
              ),
              label: const Text(
                "context.local.changePhoneNumber",
                style: TextStyle(
                  color: ColorPalate.secondary,
                ),
              ),
              onPressed: () {
                // _controller.pause();
                otpController.clear();
                changeNumber.call();
              },
            ),
          ],
        ),
      ),
    );
  }
}
