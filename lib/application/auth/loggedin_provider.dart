import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/auth/model/user_model.dart';
import '../../utils/utils.dart';
import '../local_storage/storage_handler.dart';

final loggedInProvider = ChangeNotifierProvider((ref) {
  return LoggedInNotifier(ref);
});

class LoggedInNotifier extends ChangeNotifier {
  final Ref ref;

  String get token {
    return ref.read(hiveProvider).get(KStrings.token, defaultValue: '');
  }

  UserModel get user {
    return UserModel.fromJson(ref
        .read(hiveProvider)
        .get(KStrings.user, defaultValue: UserModel.init().toJson()));
  }

  bool get loggedIn {
    return token.isEmpty && user == UserModel.init() ? false : true;
  }

  LoggedInNotifier(this.ref) : super();

  void deleteAuthCache() {
    ref.read(hiveProvider).delete(KStrings.token);
    ref.read(hiveProvider).delete(KStrings.user);
    notifyListeners();
  }

  void updateAuthCache({String? token, UserModel? user}) {
    changeToken(token ?? "");
    changeSavedUser(user ?? UserModel.init());
    notifyListeners();
  }

  void changeToken(String token) {
    ref.read(hiveProvider).put(KStrings.token, token);
  }

  void changeSavedUser(UserModel user) {
    ref.read(hiveProvider).put(KStrings.user, user.toJson());
  }
}
