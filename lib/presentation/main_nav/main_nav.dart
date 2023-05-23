import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/utils.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

final bottomNavigatorKey = GlobalKey();

class MainNav extends HookConsumerWidget {
  static const route = '/main_nav';

  const MainNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navIndex = useState(0);
    final navWidget = [
      const HomeScreen(),
      // const VendorChatListScreen(),
      // const CartScreen(),//'Cart screen exists now...
      // const ProfileScreen(),

      const Text("Wallet"),
      const Text("History"),
      const ProfileScreen()
    ];

    useEffect(() {
      // Future.wait([
      //   Future.microtask(() => ref.read(homeProvider.notifier).getHomeData()),
      // ]);

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
      child: LayoutBuilder(builder: (context, constrain) {
        // Logger.i("constrain: $constrain");
        return Scaffold(
          body: navWidget[navIndex.value],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              useMaterial3: false,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: const Color(0xff00000014),
                  width: 1.w,
                ),
              )),
              child: BottomNavigationBar(
                backgroundColor: ColorPalate.white,
                elevation: 3,
                useLegacyColorScheme: false,
                key: bottomNavigatorKey,
                currentIndex: navIndex.value,
                onTap: (index) {
                  navIndex.value = index;
                },
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorPalate.primary,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorPalate.harrisonGrey1000,
                ),
                items: [
                  BottomNavigationBarItem(
                    icon: navIndex.value == 0
                        ? Image.asset(
                            Images.iconHomeSelected,
                            width: 24.w,
                            height: 24.h,
                          )
                        : Image.asset(
                            Images.iconHome,
                            width: 24.w,
                            height: 24.h,
                          ),
                    label: context.local.home,
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      Images.iconWallet,
                      width: 24.w,
                      height: 24.h,
                    ),
                    label: context.local.wallet,
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      Images.iconClockCircle,
                      width: 24.w,
                      height: 24.h,
                    ),
                    label: context.local.history,
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      Images.iconUserRectangle,
                      width: 24.w,
                      height: 24.h,
                    ),
                    label: context.local.profile,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
