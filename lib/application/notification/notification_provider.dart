import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/profile/accept_other_problem_body.dart';
import '../../infrastructure/notification_repo.dart';
import 'notification_state.dart';

final notificationProvider =
    StateNotifierProvider<NotificationNotifier, NotificationState>((ref) {
  return NotificationNotifier(ref, NotificationRepo());
});

class NotificationNotifier extends StateNotifier<NotificationState> {
  final Ref ref;
  final NotificationRepo repo;
  NotificationNotifier(this.ref, this.repo) : super(NotificationState.init());
}
