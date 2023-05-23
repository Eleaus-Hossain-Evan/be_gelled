import 'dart:developer';

import 'package:be_gelled/presentation/auth/login/login.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/auth/loggedin_provider.dart';
import '../../application/family_member/family_member_provider.dart';
import '../../application/auth/auth_provider.dart';
import '../../application/home/home_provider.dart';
import '../../utils/utils.dart';
import '../auth/otp_screen.dart';
import '../auth/signup/signup.dart';
import '../family_member/member_list_screen.dart';
import '../order/select_package_screen.dart';
import '../widgets/widgets.dart';

final familyProvider = StateProvider<bool>((ref) {
  return false;
});

class HomeScreen extends HookConsumerWidget {
  static String route = "/home";
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final familyState = ref.watch(familyProvider);
    final member = ref.watch(familyMemberProvider).member;
    final scrollController = useScrollController();
    final state = ref.watch(homeProvider);
    final authState = ref.watch(authProvider);
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
      appBar: KAppBar(
        title: Column(
          crossAxisAlignment: crossStart,
          children: [
            Row(
              children: [
                Image.asset(
                  Images.iconLocation,
                  // width: 32.w,
                  height: 22.w,
                  fit: BoxFit.scaleDown,
                ),
                gap10,
                Text(context.local.home,
                    style: CustomTextStyle.textStyle16w600),
              ],
            ),
            Padding(
              padding: paddingLeft28,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Road 2, Sector 10, Uttara",
                        style: CustomTextStyle.textStyle16w400HG900),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.top,
                      child: InkWell(
                        onTap: () {
                          log("Road 2, Sector 10, Uttara");
                        },
                        child: Image.asset(
                          Images.iconArrowDown,
                          width: 16.w,
                          height: 16.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Badge(
              backgroundColor: ColorPalate.orange,
              isLabelVisible: true,
              child: Icon(
                Icons.notifications,
              ),
            ),
          )
        ],
      ),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: SingleChildScrollView(
          controller: scrollController,
          padding: padding16,
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              const _HomeBanner(),
              gap24,
              familyState
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: mainSpaceBetween,
                          children: [
                            Text(
                              context.local.familyMembers,
                              style: CustomTextStyle.textStyle16w600,
                            ),
                            Text(
                              context.local.addMembers,
                              style: CustomTextStyle.textStyle16w600Orange,
                            ),
                          ],
                        ),
                        KListViewSeparated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => MemberListTile(
                            index: index,
                            memberInfo:
                                ref.watch(familyMemberProvider).members[index],
                          ),
                          itemCount: member,
                          separator: gap16,
                        ),
                        gap32,
                      ],
                    )
                  : Column(
                      children: [
                        Text(
                          context.local.ridesAtYourDoorstep,
                          style: CustomTextStyle.textStyle16w600HG1000,
                        ),
                        gap16,
                        const _RideOptions(),
                        gap24,
                        _ContentOptions(
                          header: context.local.waysToPlanWithBegelled,
                          imagePath: Images.healthyFood,
                          title: context.local.healthyFood,
                          onTap: () {
                            showCustomSheet(
                              context: context,
                              builder: (context) {
                                return ref.watch(loggedInProvider).loggedIn
                                    ? const _AddFamilyMember()
                                    : LoginScreen(
                                        onPressedSend: (number) {
                                          Navigator.pop(context);
                                          context.push(
                                              "${OTPScreen.route}/Login?number=$number");
                                        },
                                        onPressedSignUp: () =>
                                            context.pushReplacement(
                                                SignupScreen.route),
                                      );
                              },
                            );
                          },
                        ),
                        gap24,
                        _ContentOptions(
                          header: context.local.getDiscount,
                          imagePath: Images.inviteFriends,
                          title: context.local.inviteFriends,
                          titleTextStyle: CustomTextStyle.textStyle16w600HG1000,
                          subtitle: context.local.get50Discount,
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

class _AddFamilyMember extends HookConsumerWidget {
  const _AddFamilyMember();

  @override
  Widget build(BuildContext context, ref) {
    final memberController = useTextEditingController(text: '0');
    final node = useFocusNode();
    return Container(
      color: ColorPalate.white,
      padding: padding16,
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Gap(32.h),
            Image.asset(
              Images.familyMember,
              width: 96.w,
              height: 96.w,
              fit: BoxFit.cover,
            ),
            gap16,
            Text(
              context.local.familyMembers,
              style: CustomTextStyle.textStyle30w700.copyWith(
                letterSpacing: -.2,
              ),
            ),
            gap4,
            Text(
              context.local.howManyFamilyMembers,
              style: CustomTextStyle.textStyle16w400HG900.copyWith(
                color: const Color(0xFF44344D),
              ),
            ),
            gap32,
            KTextFormField(
              controller: memberController,
              focusNode: node,
              labelText: context.local.familyMembers,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            gap24,
            ValueListenableBuilder(
              valueListenable: memberController,
              builder: (context, value, child) {
                return KFilledButton(
                  onPressed: value.text.isEmpty || value.text == '0'
                      ? null
                      : () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          ref.read(familyMemberProvider.notifier).setMember(
                                int.parse(value.text),
                              );
                          context.push(MemberListScreen.route);
                        },
                  text: context.local.continueText,
                );
              },
            ),
            gap32,
          ],
        ),
      ),
    );
  }
}

class _ContentOptions extends StatelessWidget {
  const _ContentOptions({
    required this.header,
    required this.imagePath,
    required this.title,
    this.titleTextStyle,
    this.subtitle,
    this.onTap,
    this.subTitleTextStyle,
  });

  final String header;
  final String imagePath;
  final String title;
  final String? subtitle;
  final TextStyle? titleTextStyle;
  final TextStyle? subTitleTextStyle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Text(
          header,
          style: CustomTextStyle.textStyle16w600HG1000,
        ),
        gap16,
        KContainer(
          height: 80.h,
          onTap: onTap,
          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: 48.w,
                height: 48.w,
                fit: BoxFit.cover,
              ),
              gap12,
              Column(
                crossAxisAlignment: crossStart,
                mainAxisAlignment: mainCenter,
                children: [
                  Text(
                    title,
                    style:
                        titleTextStyle ?? CustomTextStyle.textStyle16w400HG1000,
                  ),
                  subtitle == null
                      ? const SizedBox.shrink()
                      : Text(
                          subtitle!,
                          style: subTitleTextStyle ??
                              CustomTextStyle.textStyle14w400HG800,
                        ),
                ],
              ),
              const Spacer(),
              Image.asset(
                Images.iconArrowRight,
                width: 24.w,
                height: 24.w,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RideOptions extends StatelessWidget {
  const _RideOptions();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainSpaceBetween,
      children: [
        _option(
          imagePath: Images.bikeRide,
          title: context.local.rideSharing,
          onTap: () {},
        ),
        _option(
          imagePath: Images.boxDelivery,
          title: context.local.delivery,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _option({
    required String imagePath,
    required String title,
    final VoidCallback? onTap,
  }) {
    return KContainer(
      width: 1.sw / 2.3,
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 48.w,
            height: 48.w,
            fit: BoxFit.cover,
          ),
          gap4,
          Text(
            title,
            style: CustomTextStyle.textStyle16w400HG900,
          ),
        ],
      ),
    );
  }
}

class _HomeBanner extends StatelessWidget {
  const _HomeBanner();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            Images.banner,
            height: 140.h,
            fit: BoxFit.fill,
          );
        },
        autoplay: true,
        itemCount: 3,
        pagination: SwiperPagination(
          margin: paddingBottom8,
          builder: DotSwiperPaginationBuilder(
            activeColor: ColorPalate.white,
            color: ColorPalate.white.withOpacity(0.32),
            space: 6.w,
          ),
        ),
      ),
    );
  }
}
