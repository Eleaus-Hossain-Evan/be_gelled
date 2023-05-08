import 'package:equatable/equatable.dart';

import '../../utils/utils.dart';

class NotificationState extends Equatable {
  final bool loading;
  final CleanFailure failure;

  const NotificationState({
    required this.loading,
    required this.failure,
  });

  factory NotificationState.init() {
    return NotificationState(
      loading: false,
      failure: CleanFailure.none(),
    );
  }

  NotificationState copyWith({
    bool? loading,
    CleanFailure? failure,
  }) {
    return NotificationState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
    );
  }

  @override
  String toString() =>
      'NotificationState(loading: $loading, failure: $failure)';

  @override
  List<Object> get props => [loading, failure];
}
