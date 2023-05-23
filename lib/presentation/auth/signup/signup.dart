import 'package:be_gelled/presentation/auth/login/login.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/auth/auth_provider.dart';
import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';
import '../otp_screen.dart';
import '../widgets/phone_search_widget.dart';

class SignupScreen extends HookConsumerWidget {
  static String route = "/signup";
  const SignupScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = useTextEditingController();
    final phoneFocus = useFocusScopeNode();
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

    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(context.local.appExitText),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text(context.local.no),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(context.local.yes),
              ),
            ],
          ),
        );
      },
      child: Scaffold(
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              crossAxisAlignment: crossStart,
              children: [
                Gap(104.h),
                Text(
                  context.local.createAccount.toTitleCase(),
                  style: CustomTextStyle.textStyle30w700,
                ),
                gap8,
                Text(
                  context.local.createAccountSubtitle,
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
                KFilledButton(
                  onPressed: () {
                    context.push(
                        "${OTPScreen.route}/signup?number=${selectedPhoneDirectory.value.dialCode + phoneController.text}");
                  },
                  text: context.local.sendCode,
                ),
                gap24,
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    context.local.alreadyHaveAnAccount,
                    style: CustomTextStyle.textStyle16w500HG900,
                  ),
                ),
                gap16,
                KOutlinedButton(
                  onPressed: () => context.pushReplacement(LoginScreen.route),
                  text: context.local.logIn,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
