import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../application/auth/loggedin_provider.dart';
import '../domain/car_parts/model/car_parts_model.dart';
import '../domain/car/model/car_service_model.dart';
import '../domain/message/cusmoter_model.dart';
import '../domain/vendor/model/vendor_model.dart';
import '../domain/vendor/model/vendor_problem_model.dart';
import '../presentation/auth/login/login.dart';
import '../presentation/auth/reset_password/reset_password.dart';
import '../presentation/auth/signup/signup.dart';
import '../presentation/home/home_screen.dart';
import '../presentation/main_nav/main_nav.dart';
import '../presentation/splash/splash_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  final listenable = ValueNotifier<bool>(true);

  return GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: listenable,
      redirect: router._redirectLogic,
      routes: router._routes,
      initialLocation: SplashScreen.route,
      errorPageBuilder: router._errorPageBuilder,
      observers: [
        BotToastNavigatorObserver(),
      ]);
});

class RouterNotifier extends ChangeNotifier {
  final Ref ref;

  RouterNotifier(this.ref) {
    ref.listen<bool>(
      loggedInProvider.select((value) => value.loggedIn),
      (_, __) => notifyListeners(),
    );
  }

  String? _redirectLogic(BuildContext context, GoRouterState state) {
    final token = ref.watch(loggedInProvider.notifier).token;
    final user = ref.watch(loggedInProvider.notifier).user;

    final isLoggedIn = ref.watch(loggedInProvider).loggedIn; //bool

    Logger.i('RouterNotifier:  $isLoggedIn');
    Logger.i('RouterNotifier: $user, $token');

    final areWeLoggingIn = state.location == LoginScreen.route;
    final areWeRegistering = state.location == SignupScreen.route;

    if (!isLoggedIn && areWeLoggingIn) {
      return areWeLoggingIn ? null : LoginScreen.route;
    }
    if (!isLoggedIn && areWeRegistering) {
      return areWeRegistering ? null : SignupScreen.route;
    }

    if (areWeLoggingIn || areWeRegistering) return MainNav.route;

    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          path: SplashScreen.route,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: MainNav.route,
          builder: (context, state) => const MainNav(),
        ),
        GoRoute(
          path: HomeScreen.route,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: LoginScreen.route,
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          path: SignupScreen.route,
          builder: (context, state) => const SignupScreen(),
        ),
        GoRoute(
          path: ResetPasswordScreen.route,
          pageBuilder: (context, state) => SlideBottomToTopTransitionPage(
            key: state.pageKey,
            child: const ResetPasswordScreen(),
          ),
        ),
      ];
  Page<void> _errorPageBuilder(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          // backgroundColor: Theme.of(context).errorColor.withOpacity(.1),
          body: Center(
            child: Text('Error: ${state.error.toString()}'),
          ),
        ),
      );
}

class SlideRightToLeftTransitionPage extends CustomTransitionPage {
  SlideRightToLeftTransitionPage({
    LocalKey? key,
    required Widget child,
    bool fullscreenDialog = true,
  }) : super(
          key: key,
          fullscreenDialog: fullscreenDialog,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.easeInOut),
                ),
              ),
              child: child,
            );
          },
          child:
              child, // Here you may also wrap this child with some common designed widget
        );
}

class SlideBottomToTopTransitionPage extends CustomTransitionPage {
  SlideBottomToTopTransitionPage({
    LocalKey? key,
    required Widget child,
  }) : super(
          key: key,
          fullscreenDialog: true,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.easeInOut),
                ),
              ),
              child: child,
            );
          },
          child:
              child, // Here you may also wrap this child with some common designed widget
        );
}
