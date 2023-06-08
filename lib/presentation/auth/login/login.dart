import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/auth/auth_provider.dart';
import '../../../domain/auth/login_body.dart';
import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';
import '../signup/signup.dart';
import '../widgets/phone_search_widget.dart';

class LoginScreen extends HookConsumerWidget {
  static String route = "/login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = useTextEditingController();
    final phoneFocus = useFocusScopeNode();
    final remember = useState<bool>(false);
    final formKey = useMemoized(GlobalKey.new);
    List<PhoneDirectory> directory =
        useMemoized(() => PhoneDirectoryProvider.getDirectories());

    final selectedPhoneDirectory = useState<PhoneDirectory>(directory.first);

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

    // useEffect(() {
    //   directory = PhoneDirectoryProvider.getDirectories();
    // }, const []);

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
                context.local.logIn.toTitleCase(),
                style: CustomTextStyle.textStyle30w700,
              ),
              gap8,
              Text(
                context.local.logInSubtitle,
                style: CustomTextStyle.textStyle16w400HG900,
              ),
              gap32,
              KTextFormField(
                controller: phoneController,
                focusNode: phoneFocus,
                keyboardType: TextInputType.phone,
                labelText: context.local.phoneNumber,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(right: 2.w),
                  child: KInkWell(
                    onTap: () => showPhoneSelectingSheet(
                      context: context,
                      directory: directory,
                      directorySelector: (PhoneDirectory? agentType) {
                        selectedPhoneDirectory.value = agentType!;
                        log(selectedPhoneDirectory.value.toString());
                      },
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(selectedPhoneDirectory.value.flag),
                        const Icon(Icons.arrow_drop_down_rounded),
                        Text(
                          selectedPhoneDirectory.value.dialCode,
                          style: CustomTextStyle.textStyle18w500HG1000,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              gap24,
              FilledButton(
                onPressed: () async {
                  final success = await ref
                      .read(authProvider.notifier)
                      .loginGetOtp(LoginBody(phone: phoneController.text));
                  if (success) Navigator.pop(context);
                },
                child: Text(context.local.sendCode),
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
                  InkWell(
                    onTap: () => remember.value = !remember.value,
                    child: Row(
                      children: [
                        Checkbox(
                          value: remember.value,
                          onChanged: (value) {
                            remember.value = value!;
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          side: BorderSide(
                            color: ColorPalate.harrisonGrey1000,
                            width: 1.5.w,
                          ),
                          visualDensity: VisualDensity.compact,
                        ),
                        Text(
                          context.local.remember,
                          style: CustomTextStyle.textStyle16w500HG900,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: KInkWell(
                      // style: ButtonStyle(
                      //   padding: MaterialStateProperty.all(EdgeInsets.zero),
                      // ),
                      child: Text(
                        context.local.forgotPassword,
                        style: CustomTextStyle.textStyle16w600Orange,
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              gap24,
              Align(
                alignment: Alignment.center,
                child: Text(
                  context.local.dontHaveAccount,
                  style: CustomTextStyle.textStyle16w500HG900,
                ),
              ),
              gap16,
              KOutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.push(SignupScreen.route);
                },
                text: context.local.createAccount,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
