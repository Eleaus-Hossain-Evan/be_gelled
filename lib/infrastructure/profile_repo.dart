import 'dart:convert';

import '../domain/car/car_service_list_response.dart';
import '../domain/car/car_service_response .dart';
import '../domain/car/model/car_service_model.dart';
import '../domain/profile/package_list_response.dart';
import '../domain/profile/review_body.dart';
import '../domain/simple_response.dart';
import '../utils/utils.dart';

class ProfileRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, PackageListResponse>> getOnGoingPackages() async {
    final data = await api.get(
      fromData: (json) => PackageListResponse.fromMap(json),
      endPoint: APIRoute.ON_GOING_PACKAGE,
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

  Future<Either<CleanFailure, PackageListResponse>>
      getCompletedPackages() async {
    final data = await api.get(
      fromData: (json) => PackageListResponse.fromMap(json),
      endPoint: APIRoute.COMPLETED_PACKAGE,
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

  Future<Either<CleanFailure, SimpleResponse>> submitReviewRating(
      ReviewBody body) async {
    final data = await api.post(
      body: body.toMap(),
      fromData: (json) => SimpleResponse.fromMap(json),
      endPoint: APIRoute.SUBMIT_REVIEW,
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

  Future<Either<CleanFailure, CarServiceListResponse>>
      getAllCarService() async {
    final data = await api.get(
      fromData: (json) => CarServiceListResponse.fromMap(json),
      endPoint: APIRoute.CAR_SERVICE_VIEW_ALL,
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

  Future<Either<CleanFailure, CarServiceResponse>> addCarService(
      String carId) async {
    final data = await api.post(
      body: {"carId": carId},
      fromData: (json) => CarServiceResponse.fromMap(json),
      endPoint: APIRoute.CAR_SERVICE_ADD,
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

  Future<Either<CleanFailure, CarServiceResponse>> updateCarService(
      CarServiceModel model) async {
    final data = await api.put(
      body: model.toMap(),
      fromData: (json) => CarServiceResponse.fromMap(json),
      endPoint: APIRoute.CAR_SERVICE_UPDATE,
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
