import 'dart:developer';

import 'package:app_version_update/app_version_update.dart';
import 'package:be_gelled/presentation/main_nav/main_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/utils.dart';

class SplashScreen extends HookConsumerWidget {
  static const route = '/';

  const SplashScreen({Key? key}) : super(key: key);

  // @override
  // void initState() {
  //   Future.delayed(const Duration(seconds: 3), () {
  //     // Navigator.pushReplacement(
  //     //     context,
  //     //     MaterialPageRoute(
  //     //       builder: (context) => LoginScreen(),
  //     //     ));
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context, ref) {
    final hasUpdate = useState(false);

    Future<void> appVersionCheck() async {
      await AppVersionUpdate.checkForUpdates().then((data) async {
        log(data.storeUrl.toString());
        log(data.storeVersion.toString());
        if (data.canUpdate!) {
          hasUpdate.value = data.canUpdate!;
          //showDialog(... your custom widgets view)
          //or use our widgets
          // AppVersionUpdate.showAlertUpdate
          // AppVersionUpdate.showBottomSheetUpdate
          // AppVersionUpdate.showPageUpdate
          AppVersionUpdate.showAlertUpdate(
            context: context,
            appVersionResult: data,
          );
        }
      });
    }

    useEffect(() {
      // Future.microtask(() => appVersionCheck());
      Future.microtask(() {
        return hasUpdate.value
            ? null
            : Future.delayed(const Duration(seconds: 3), () {
                Router.neglect(context, () {
                  context.go(MainNav.route);
                });
              });
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: ColorPalate.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Center(
        child: Image.asset(
          Images.logo,
          fit: BoxFit.cover,
          width: 0.5.sw,
        ),
      ),
    );
  }
}
