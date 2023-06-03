import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/home/home_provider.dart';
import '../../utils/utils.dart';
import '../order/select_package_screen.dart';
import 'widgets/content_options.dart';
import 'widgets/family_member_list.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_banner.dart';
import 'widgets/ride_options.dart';

final familyProvider = StateProvider<bool>((ref) {
  return false;
});

class HomeScreen extends HookConsumerWidget {
  static String route = "/home";
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final familyState = ref.watch(familyProvider);
    final scrollController = useScrollController();
    // final state = ref.watch(homeProvider);
    // final authState = ref.watch(authProvider);
    ref.listen(homeProvider, (previous, next) {
      if (previous!.loading == false && next.loading) {
        BotToast.showLoading();
      }
      if (previous.loading == true && next.loading == false) {
        BotToast.closeAllLoading();
      }
    });

    useEffect(() {
      Future.wait([
        // Future.microtask(() => ref.read(carServiceProvider.notifier).getYear()),
        // Future.microtask(
        //     () => ref.read(carServiceProvider.notifier).getAllProblems()),
      ]);
      return null;
    }, []);

    //f53d2d

    return Scaffold(
      appBar: const HomeAppBarWidget(),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: SingleChildScrollView(
          controller: scrollController,
          padding: padding16,
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              const HomeBanner(),
              gap24,
              familyState
                  ? const FamilyMemberListWidget()
                  : Column(
                      children: [
                        Text(
                          context.local.ridesAtYourDoorstep,
                          style: CustomTextStyle.textStyle16w600HG1000,
                        ),
                        gap16,
                        const RideOptions(),
                        gap24,
                        // ContentOptions(
                        //   header: context.local.waysToPlanWithBegelled,
                        //   imagePath: Images.healthyFood,
                        //   title: context.local.healthyFood,
                        //   onTap: () {
                        //     showCustomSheet(
                        //       context: context,
                        //       builder: (context) {
                        //         return ref.watch(loggedInProvider).loggedIn
                        //             ? const AddFamilyMember()
                        //             : LoginScreen(
                        //                 onPressedSend: (number) {
                        //                   Navigator.pop(context);
                        //                   context.push(
                        //                       "${OTPScreen.route}/Login?number=$number");
                        //                 },
                        //                 onPressedSignUp: () =>
                        //                     context.pushReplacement(
                        //                         SignupScreen.route),
                        //               );
                        //       },
                        //     );
                        //   },
                        // ),
                        // gap24,
                        ContentOptions(
                          header: context.local.getDiscount,
                          imagePath: Images.inviteFriends,
                          title: context.local.inviteFriends,
                          titleTextStyle: CustomTextStyle.textStyle16w600HG1000,
                          subtitle: context.local.get50Discount,
                          onTap: () {},
                        ),
                        gap24,
                        ContentOptions(
                          header: 'First 10 free registration!',
                          imagePath: Images.inviteFriends,
                          title: "Want to become a Vendor?",
                          titleTextStyle: CustomTextStyle.textStyle16w600HG1000,
                          subtitle: "First 10 free registration!",
                          onTap: () {},
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: familyState
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(
                bottom: 32.h,
              ),
              child: FilledButton(
                onPressed: () {
                  context.push(SelectPackageScreen.route);
                },
                child: Text(context.local.createOrder),
              ),
            )
          : null,
    );
  }
}
