import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../application/global.dart';
import '../../application/home/home_provider.dart';
import '../../application/notification/notification_provider.dart';
import '../../domain/profile/accept_other_problem_body.dart';
import '../../domain/profile/model/other_problem_unaccepted.dart';
import '../../utils/utils.dart';
import '../widgets/widgets.dart';

class NotificationScreen extends HookConsumerWidget {
  static String route = "/notification";
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationProvider);
    final loading = useState(false);

    ref.listen(notificationProvider, (previous, next) {
      if (previous!.loading == false && next.loading) {
        BotToast.showLoading();
        loading.value = true;
      }
      if (previous.loading == true && next.loading == false) {
        BotToast.closeAllLoading();
        loading.value = false;
      }
    });

    useEffect(() {
      Future.microtask(() {
        ref.read(notificationProvider.notifier).getNotification();
      });
      Future.microtask(() {
        ref.read(homeProvider.notifier).removeNotificationBadge();
      });
      return () => ref.invalidate(notificationProvider);
    }, const []);
    return Scaffold(
      backgroundColor: ColorPalate.white2,
      appBar: KAppBar(
        titleText: "context.local.notification",
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            loading.value
                ? const SizedBox.shrink()
                : Container(
                    margin: paddingH20,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: ColorPalate.white1,
                      borderRadius: radius16,
                    ),
                    child: Row(
                      crossAxisAlignment: crossCenter,
                      children: [
                        Image.asset(
                          KAssets.vendorProfilePic,
                          height: 64.h,
                          width: 64.w,
                        ),
                        gap16,
                        Flexible(
                          child: Column(
                            crossAxisAlignment: crossStart,
                            children: [
                              Text(
                                "Lorem ipsum dolor sit amet consectetur. Non massa molestie nequ.",
                                softWrap: true,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyle.textStyle12w600Black3,
                              ),
                              gap4,
                              Text(
                                '9:20AM',
                                style: CustomTextStyle.textStyle10w600Grey3,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
            KListViewSeparated(
              shrinkWrap: true,
              padding: EdgeInsetsDirectional.fromSTEB(20.w, 16.h, 20.w, 16.h),
              itemBuilder: (context, index) {
                final notification = state.notifications[index];
                return SizedBox();
              },
              itemCount: state.notifications.length,
              separator: SizedBox(height: 12.h),
            ),
          ],
        ),
      ),
    );
  }
}
