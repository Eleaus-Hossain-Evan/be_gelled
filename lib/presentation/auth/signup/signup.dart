import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/auth/auth_provider.dart';
import '../../../domain/auth/signup_body.dart';
import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';

class SignupScreen extends HookConsumerWidget {
  static String route = "/signup";
  const SignupScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);

    final formKey = useMemoized(GlobalKey<FormState>.new);
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final emailController = useTextEditingController();
    final phoneController = useTextEditingController();
    final referralController = useTextEditingController();

    final lastNameFocusNode = useFocusNode();
    final emailFocusNode = useFocusNode();
    final phoneFocusNode = useFocusNode();
    final referralFocusNode = useFocusNode();

    ref.listen(authProvider, (previous, next) {
      if (previous!.loading == false && next.loading) {
        BotToast.showLoading();
      }
      if (previous.loading == true && next.loading == false) {
        BotToast.closeAllLoading();
      }
    });
    return Scaffold(
      backgroundColor: ColorPalate.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              Text(
                "context.local.signup.toTitleCase()",
                // style: CustomTextStyle.textStyle32w600,
              ),
              gap20,
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
                child: Text(
                  "context.local.signupBelowText",
                  style: TextStyle(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Material(
        child: Hero(
          tag: "bottomSheet",
          child: IntrinsicHeight(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                padding: EdgeInsetsDirectional.fromSTEB(20.w, 0, 20.w, 0),
                child: Column(
                  children: [
                    gap36,
                    Row(
                      children: [
                        Flexible(
                          child: KTextFormField(
                            hintText: "context.local.firstName",
                            controller: firstNameController,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              lastNameFocusNode.requestFocus();
                            },
                          ),
                        ),
                        gap16,
                        Flexible(
                          child: KTextFormField(
                            hintText: "context.local.lastName",
                            controller: lastNameController,
                            textInputAction: TextInputAction.next,
                            focusNode: lastNameFocusNode,
                            onFieldSubmitted: (value) {
                              emailFocusNode.requestFocus();
                            },
                          ),
                        ),
                      ],
                    ),
                    gap16,
                    KTextFormField(
                      hintText: "context.local.email",
                      controller: emailController,
                      focusNode: emailFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        phoneFocusNode.requestFocus();
                      },
                    ),
                    gap16,
                    KTextFormField(
                      hintText: "context.local.phoneNumber",
                      controller: phoneController,
                      focusNode: phoneFocusNode,
                      keyboardType: TextInputType.phone,
                      onFieldSubmitted: (value) {
                        referralFocusNode.requestFocus();
                      },
                    ),
                    gap16,
                    KTextFormField(
                      hintText: "context.local.referralCode",
                      controller: referralController,
                      focusNode: referralFocusNode,
                      onFieldSubmitted: (value) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                    ),
                    gap24,
                    KFilledButton(
                      color: context.color.secondary,
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        bool success = false;
                        success = await ref.read(authProvider.notifier).signUp(
                              SignupBody(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                usedReferralCode: referralController.text,
                                language: state.language,
                              ),
                            );
                        if (success) {
                          ref.invalidate(authProvider);
                          context.pop();
                        }
                      },
                      text: " context.local.signup",
                    ),
                    gap16,
                    Text(
                      "context.local.orSignupWith",
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                    gap16,
                    Row(
                      children: [
                        Flexible(
                          child: KFilledButton(
                            // backgroundColor: ColorPalate.fbColor,
                            onPressed: () => context.push(SignupScreen.route),
                            text: '',
                            child: Image.asset(
                              "KAssets.fbIcon",
                              height: 20.h,
                            ),
                          ),
                        ),
                        gap16,
                        Flexible(
                          child: KFilledButton(
                            // backgroundColor: ColorPalate.googleColor,
                            onPressed: () => context.push(SignupScreen.route),
                            text: '',
                            child: Image.asset(
                              "KAssets.googleIcon",
                              height: 20.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                    gap24,
                    Text(
                      "context.local.signUpPrivacyPolicy",
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                    gap40,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
