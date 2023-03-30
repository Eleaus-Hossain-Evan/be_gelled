import 'dart:convert';

import '../domain/profile/accept_other_problem_body.dart';
import '../domain/profile/other_problem_unaccepted_list_response.dart';
import '../domain/simple_response.dart';
import '../utils/utils.dart';

class NotificationRepo {
  final api = NetworkHandler.instance;
  Future<Either<CleanFailure, OtherProblemUnAcceptedListResponse>>
      getNotification() async {
    final data = await api.get(
      fromData: (json) => OtherProblemUnAcceptedListResponse.fromMap(json),
      endPoint: APIRoute.NOTIFICATION,
      withToken: true,
    );

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']["message"]);
      return left(failure);
    }, (r) {
      return right(r);
    });
  }

  Future<Either<CleanFailure, SimpleResponse>> acceptOtherProblem(
      AcceptOtherProblemBody body) async {
    final data = await api.put(
      body: body.toMap(),
      fromData: (json) => SimpleResponse.fromMap(json),
      endPoint: APIRoute.ACCEPTED_OTHER_PROBLEM,
      withToken: true,
    );

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']["message"]);
      return left(failure);
    }, (r) {
      return right(r);
    });
  }
}
