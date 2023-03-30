import 'dart:convert';

import 'package:flutter_easylogger/flutter_logger.dart';

import '../domain/car/car_service_item_response.dart';
import '../domain/car/service_problem_all_response.dart';
import '../domain/car_parts/car_parts_list_response.dart';
import '../domain/car/car_service_list_response.dart';
import '../domain/car_parts/car_parts_order_body.dart';
import '../domain/car_parts/car_parts_order_confirm_response.dart';
import '../domain/simple_response.dart';
import '../domain/vendor/vendor_problem_response.dart';
import '../domain/vendor/vendor_problem_submit_body.dart';
import '../domain/vendor/vendor_view_response.dart';
import '../utils/utils.dart';

class CarRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, CarServiceItemResponse>> findCarService(
      Map<String, dynamic> body) async {
    final data = await api.post(
      body: body,
      fromData: (json) => CarServiceItemResponse.fromMap(json),
      endPoint: APIRoute.CAR_SERVICE,
      withToken: true,
    );

    Logger.v("data: $data");

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']["message"]);
      return left(failure);
    }, (r) => right(r));
  }

  Future<Either<CleanFailure, CarServiceListResponse>> getServiceObj(
      Map<String, dynamic> body) async {
    final data = await api.post(
      body: body,
      fromData: (json) => CarServiceListResponse.fromMap(json),
      endPoint: APIRoute.CAR_SERVICE,
      withToken: true,
    );

    Logger.v("data: $data");

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']["message"]);
      return left(failure);
    }, (r) => right(r));
  }

  Future<Either<CleanFailure, ServiceProblemAllResponse>>
      getAllProblems() async {
    final data = await api.get(
      fromData: (json) => ServiceProblemAllResponse.fromMap(json),
      endPoint: APIRoute.SERVICE_PROBLEM_ALL,
      withToken: true,
    );

    Logger.v("data: $data");

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']["message"]);
      return left(failure);
    }, (r) => right(r));
  }

  Future<Either<CleanFailure, VendorProblemResponse>> submitProblems(
      List<String> problems) async {
    final data = await api.post(
      body: {"problemAr": problems},
      fromData: (json) => VendorProblemResponse.fromMap(json),
      endPoint: APIRoute.SUBMIT_PROBLEMS,
      withToken: true,
    );

    Logger.v("data: $data");

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']["message"]);
      return left(failure);
    }, (r) => right(r));
  }

  Future<Either<CleanFailure, SimpleResponse>> bookVendorProblem(
      VendorProblemSubmitBody body, bool haveOther) async {
    final data = await api.post(
      body: haveOther ? body.toMap() : body.toWithoutOtherMap(),
      fromData: (json) => SimpleResponse.fromMap(json),
      endPoint: APIRoute.BOOK_VENDOR_PROBLEMS,
      withToken: true,
    );

    Logger.v("data: $data");

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']["message"]);
      return left(failure);
    }, (r) => right(r));
  }

  Future<Either<CleanFailure, VendorViewResponse>> vendorViews() async {
    final data = await api.get(
      fromData: (json) => VendorViewResponse.fromMap(json),
      endPoint: APIRoute.VENDOR_VIEWS,
      withToken: true,
    );

    Logger.v("vendorViews: $data");

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']["message"]);
      return left(failure);
    }, (r) => right(r));
  }

  Future<Either<CleanFailure, CarPartsListResponse>> getCarPartsList(
      String carId) async {
    final data = await api.get(
      fromData: (json) => CarPartsListResponse.fromMap(json),
      endPoint: APIRoute.CAR_PARTS_LIST + carId,
      withToken: true,
    );

    Logger.v("vendorViews: $data");

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']["message"]);
      return left(failure);
    }, (r) => right(r));
  }

  Future<Either<CleanFailure, CarPartsOrderConfirmResponse>> bitCarParts(
      CarPartsOrderBody body) async {
    final data = await api.post(
      body: body.toMap(),
      fromData: (json) => CarPartsOrderConfirmResponse.fromMap(json),
      endPoint: APIRoute.CAR_PARTS_BIT,
      withToken: true,
    );

    Logger.v("vendorViews: $data");

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']["message"]);
      return left(failure);
    }, (r) => right(r));
  }
}


//   void otherSocketSubmit({
//     required String userId,
//     required String other,
//     required List<String> vendors,
//   }) {
//     socket = IO.io(APIRoute.BASE_URL, <String, dynamic>{
//       'autoConnect': false,
//       'transports': ['websocket'],
//     });
//     if (socket != null) {
//       socket!.connect();
//       socket!.onConnect((_) {
//         log('Connection established');
//         socket!.emit('joinRoom', userId);
//       });
//       socket!.onDisconnect((_) => log('Connection Disconnection'));
//       socket!.onConnectError((err) => log(err));
//       socket!.onError((err) => log(err));
//       socket!.emit(
//         "othersUserSubmit",
//         {"othersProblem": other, "vendor": vendors},
//       );

//       socket!.on('othersReceive-UserPanel', (data) {
//         // final map = Map<String, dynamic>.from(data);
//         final otherProblem = OtherReceive.fromMap(data);

//         log("*********************************************************");
//         Logger.d("playerData: $data");
//         Logger.d("otherProblem: $otherProblem");
//         log("*********************************************************");
//       });

// //       {
// //         final otherReceive =
// //             OtherReceive.fromMap(data as Map<String, dynamic>);
// //         log("*********************************************************");
// //         log("playerData: $data");
// //         log("otherReceive: $otherReceive");
// //         log("*********************************************************");

// // // [log] Connection established
// // // [log] *********************************************************
// // // [log] playerData: {othersProblem: my problem, receiverId: 63d0460092e5fb2002c99a58}
// // // [log] *********************************************************
// //       });
//     }
//   }
