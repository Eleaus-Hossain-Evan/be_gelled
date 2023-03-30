import 'package:equatable/equatable.dart';

import '../../domain/car/model/car_service_model.dart';
import '../../domain/profile/model/package_model.dart';
import '../../utils/utils.dart';

class ProfileState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final List<PackageModel> onGoingPackages;
  final List<PackageModel> completedPackages;
  final List<CarServiceModel> carServiceList;

  const ProfileState({
    required this.loading,
    required this.failure,
    required this.onGoingPackages,
    required this.completedPackages,
    required this.carServiceList,
  });

  factory ProfileState.init() {
    return ProfileState(
      loading: false,
      failure: CleanFailure.none(),
      onGoingPackages: const [],
      completedPackages: const [],
      carServiceList: const [],
    );
  }

  ProfileState copyWith({
    bool? loading,
    CleanFailure? failure,
    List<PackageModel>? onGoingPackages,
    List<PackageModel>? completedPackages,
    List<CarServiceModel>? carServiceList,
  }) {
    return ProfileState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      onGoingPackages: onGoingPackages ?? this.onGoingPackages,
      completedPackages: completedPackages ?? this.completedPackages,
      carServiceList: carServiceList ?? this.carServiceList,
    );
  }

  @override
  String toString() {
    return 'ProfileState(loading: $loading, failure: $failure, onGoingPackages: $onGoingPackages, completedPackages: $completedPackages, carServiceList: $carServiceList)';
  }

  @override
  List<Object> get props {
    return [
      loading,
      failure,
      onGoingPackages,
      completedPackages,
      carServiceList,
    ];
  }
}
