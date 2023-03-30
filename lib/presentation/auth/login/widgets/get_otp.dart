import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../utils/utils.dart';
import '../../../widgets/widgets.dart';
import '../../signup/signup.dart';

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
              KTextFormField(
                hintText: "context.local.phoneNumber",
                controller: phoneController,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).unfocus();
                },
                onChanged: (value) {
                  phone.value = value;
                },
                validator: ValidationBuilder()
                    .phone()
                    .required()
                    .maxLength(14)
                    .minLength(11)
                    .build(),
              ),
              gap24,
              KElevatedButton(
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
              Text(
                "context.local.or",
                textAlign: TextAlign.center,
                style: context.headline6.copyWith(
                  color: ColorPalate.grey1,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.50,
                ),
              ),
              gap16,
              KElevatedButton(
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
