import 'package:equatable/equatable.dart';

import '../../domain/home/model/home_data.dart';
import '../../domain/profile/model/other_problem_unaccepted.dart';
import '../../utils/network_util/network_handler.dart';

class HomeState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final HomeData homeData;
  final bool notification;
  final bool chatNotification;
  final List<NotificationModel> notifications;

  const HomeState({
    required this.loading,
    required this.failure,
    required this.homeData,
    required this.notification,
    required this.chatNotification,
    required this.notifications,
  });

  factory HomeState.init() => HomeState(
        loading: false,
        failure: CleanFailure.none(),
        homeData: HomeData.init(),
        notification: false,
        chatNotification: false,
        notifications: const [],
      );

  HomeState copyWith({
    bool? loading,
    CleanFailure? failure,
    HomeData? homeData,
    bool? notification,
    bool? chatNotification,
    List<NotificationModel>? notifications,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      homeData: homeData ?? this.homeData,
      notification: notification ?? this.notification,
      chatNotification: chatNotification ?? this.chatNotification,
      notifications: notifications ?? this.notifications,
    );
  }

  @override
  String toString() {
    return 'HomeState(loading: $loading, failure: $failure, homeData: $homeData, notification: $notification, chatNotification: $chatNotification, notifications: $notifications)';
  }

  @override
  List<Object> get props {
    return [
      loading,
      failure,
      homeData,
      notification,
      chatNotification,
      notifications,
    ];
  }
}
