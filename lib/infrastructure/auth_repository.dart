import 'dart:convert';

import '../../domain/auth/login_send_otp_response.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../utils/strings.dart';

import '../domain/auth/login_body.dart';
import '../domain/auth/signup_response.dart';
import '../domain/auth/signup_body.dart';
import '../utils/api_routes.dart';
import '../utils/network_util/network_handler.dart';

class AuthRepo {
  final api = NetworkHandler.instance;
  // @override
  // Future<Option<UserModel>> getUserData() {}

  Future<Either<CleanFailure, LoginSendOtpResponse>> loginGetOtp(
      LoginBody body) async {
    final data = await api.post(
      fromData: (json) => LoginSendOtpResponse.fromMap(json),
      endPoint: APIRoute.LOGIN_SEND_OTP,
      body: body.toMap(),
      withToken: false,
    );

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']["message"]);
      return left(failure);
    }, (r) {
      Logger.v("data: $data");
      return right(r);
    });
  }

  Future<Either<CleanFailure, AuthResponse>> loginCheckOtp(
      LoginOtpBody body) async {
    final data = await api.post(
      fromData: (json) => AuthResponse.fromMap(json),
      endPoint: APIRoute.LOGIN_CHECK_OTP,
      body: body.toMap(),
      withToken: false,
    );

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']["message"]);
      return left(failure);
    }, (r) {
      Logger.v("data: $data");
      final box = Hive.box(KStrings.cacheBox);
      box.put(KStrings.token, r.user.token);
      api.setToken(r.user.token);
      return right(r);
    });
  }

  Future<Either<CleanFailure, AuthResponse>> signUp(SignupBody body) async {
    final data = await api.post(
      fromData: (json) => AuthResponse.fromMap(json),
      endPoint: APIRoute.SIGNUP,
      body: body.toMap(),
      withToken: false,
    );

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']['message']);
      return left(failure);
    }, (r) {
      return right(r);
    });
  }
}
