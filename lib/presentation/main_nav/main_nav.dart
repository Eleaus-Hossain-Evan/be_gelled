import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/auth/auth_provider.dart';
import '../../application/auth/loggedin_provider.dart';
import '../../application/home/home_provider.dart';

import '../../utils/utils.dart';
import '../cart/cart_screen.dart';
import '../home/home_screen.dart';

final bottomNavigatorKey = GlobalKey();

class MainNav extends HookConsumerWidget {
  static const route = '/main_nav';

  const MainNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = ref.watch(loggedInProvider);

    final navIndex = useState(0);
    final navWidget = [
      const HomeScreen(),
      // const VendorChatListScreen(),
      const CartScreen(),
      // const ProfileScreen(),
    ];

    useEffect(() {
      Future.wait([
        Future.microtask(() => ref.read(homeProvider.notifier).getHomeData()),
      ]);

      // Future.microtask(() => ref.read(homeProvider.notifier).getHomeData());

      // Future.microtask(
      //     () => ref.read(categoryProvider.notifier).fetchAllCategories());
      // ref.watch(loggedInProvider).isLoggedIn
      //     ? Future.microtask(() => ref.read(cartProvider.notifier).fetchCart())
      //     : null;
      // Future.microtask(() =>
      //     ref.read(instructorProvider.notifier).fetchAllFeaturedInstructors());
      return null;
    }, []);

    return LayoutBuilder(builder: (context, constrain) {
      // Logger.i("constrain: $constrain");
      return Scaffold(
        body: navWidget[navIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorPalate.white1,
          key: bottomNavigatorKey,
          currentIndex: navIndex.value,
          onTap: (index) {
            navIndex.value = index;
          },
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 10.sp,
          unselectedFontSize: 10.sp,
          selectedItemColor: context.color.primary,
          unselectedItemColor: ColorPalate.black1,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                KAssets.home,
                width: 24.w,
                height: 24.h,
                color: navIndex.value == 0
                    ? context.color.primary
                    : ColorPalate.black1,
              ),
              label: "context.local.home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                KAssets.message,
                width: 24.w,
                height: 24.h,
                color: navIndex.value == 1
                    ? context.color.primary
                    : ColorPalate.black1,
              ),
              label: "context.local.message",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                KAssets.cart,
                width: 24.w,
                height: 24.h,
                color: navIndex.value == 2
                    ? context.color.primary
                    : ColorPalate.black1,
              ),
              label: "context.local.cart",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                KAssets.account,
                width: 24.w,
                height: 24.h,
                color: navIndex.value == 3
                    ? context.color.primary
                    : ColorPalate.black1,
              ),
              label: "context.local.profile",
            ),
          ],
        ),
      );
    });
  }
}
