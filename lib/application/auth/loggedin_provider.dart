import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/auth/model/user_model.dart';
import '../../utils/utils.dart';
import '../local_storage/storage_handler.dart';

final loggedInProvider =
    StateNotifierProvider<LoggedInNotifier, LoggedInState>((ref) {
  return LoggedInNotifier(ref);
});

class LoggedInNotifier extends StateNotifier<LoggedInState> {
  final Ref ref;

  LoggedInNotifier(this.ref) : super(LoggedInState.init());

  void deleteCache() {
    ref.read(hiveProvider).delete(KStrings.token);
    ref.read(hiveProvider).delete(KStrings.user);
    state = state.copyWith(loggedIn: false);
  }

  void saveCache(String token, UserModel user) {
    ref.read(hiveProvider).put(KStrings.token, token);
    saveUser(user);
  }

  void saveUser(UserModel user) {
    ref.read(hiveProvider).put(KStrings.user, user.toJson());
  }

  String token() {
    return ref.read(hiveProvider).get(KStrings.token, defaultValue: '');
  }

  UserModel user() {
    return UserModel.fromJson(ref
        .read(hiveProvider)
        .get(KStrings.user, defaultValue: UserModel.init().toJson()));
  }

  void isLoggedIn() {
    state = state.copyWith(
        loggedIn: token().isEmpty && user() == UserModel.init() ? false : true);
  }

  void onAppStart() {
    state = state.copyWith(
        onboarding:
            ref.read(hiveProvider).get(KStrings.onBoard, defaultValue: false));
  }

  void setOnboarding(bool value) {
    ref.read(hiveProvider).put(KStrings.onBoard, value);
    state = state.copyWith(onboarding: value);
  }
}

class LoggedInState extends Equatable {
  final bool loggedIn;
  final bool onboarding;

  const LoggedInState({
    required this.loggedIn,
    required this.onboarding,
  });

  factory LoggedInState.init() {
    return const LoggedInState(
      loggedIn: false,
      onboarding: false,
    );
  }

  LoggedInState copyWith({
    bool? loggedIn,
    bool? onboarding,
  }) {
    return LoggedInState(
      loggedIn: loggedIn ?? this.loggedIn,
      onboarding: onboarding ?? this.onboarding,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'loggedIn': loggedIn,
      'onboarding': onboarding,
    };
  }

  factory LoggedInState.fromMap(Map<String, dynamic> map) {
    return LoggedInState(
      loggedIn: map['loggedIn'] ?? false,
      onboarding: map['onboarding'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoggedInState.fromJson(String source) =>
      LoggedInState.fromMap(json.decode(source));

  @override
  String toString() =>
      'LoggedInState(loggedIn: $loggedIn, onboarding: $onboarding)';

  @override
  List<Object> get props => [loggedIn, onboarding];
}
