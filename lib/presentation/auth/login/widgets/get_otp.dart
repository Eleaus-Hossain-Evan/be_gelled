import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

typedef GoToSignUp = void Function();

class GetOtpWidget extends HookConsumerWidget {
  const GetOtpWidget({
    Key? key,
    required this.phoneController,
    required this.sendOtp,
    required this.goToSignUp,
    required this.phone,
  }) : super(key: key);

  final TextEditingController phoneController;
  final Function() sendOtp;
  final GoToSignUp goToSignUp;
  final ValueNotifier phone;

  @override
  Widget build(BuildContext context, ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    return Form(
      key: formKey,
      child: Material(
        child: SingleChildScrollView(
          padding: EdgeInsetsDirectional.fromSTEB(20.w, 0, 20.w, 0),
          child: Column(
            children: [
              gap36,
              // KTextFormField(
              //   hintText: "context.local.phoneNumber",
              //   controller: phoneController,
              //   keyboardType: TextInputType.phone,
              //   textInputAction: TextInputAction.next,
              //   onFieldSubmitted: (value) {
              //     FocusScope.of(context).unfocus();
              //   },
              //   onChanged: (value) {
              //     phone.value = value;
              //   },
              //   validator: ValidationBuilder()
              //       .phone()
              //       .required()
              //       .maxLength(14)
              //       .minLength(11)
              //       .build(),
              // ),
              gap24,
              KFilledButton(
                isSecondary: true,
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (formKey.currentState!.validate()) {
                    sendOtp.call();
                  }
                },
                text: "context.local.getOtp",
              ),
              gap24,
              const Text(
                "context.local.or",
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
              gap16,
              KFilledButton(
                onPressed: goToSignUp,
                text: "context.local.signup",
              ),
              bottomGap,
            ],
          ),
        ),
      ),
    );
  }
}
