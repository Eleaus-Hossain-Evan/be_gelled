import 'dart:convert';

import 'package:equatable/equatable.dart';

class VendorProblemSubmitBody extends Equatable {
  final String carService;
  final String vendor;
  final List<ServiceProblem> serviceProblem;
  final String othersProblem;

  const VendorProblemSubmitBody({
    required this.carService,
    required this.vendor,
    required this.serviceProblem,
    required this.othersProblem,
  });

  factory VendorProblemSubmitBody.init() => const VendorProblemSubmitBody(
        carService: '',
        vendor: '',
        serviceProblem: [],
        othersProblem: '',
      );

  VendorProblemSubmitBody copyWith({
    String? carService,
    String? vendor,
    List<ServiceProblem>? serviceProblem,
    String? othersProblem,
  }) {
    return VendorProblemSubmitBody(
      carService: carService ?? this.carService,
      vendor: vendor ?? this.vendor,
      serviceProblem: serviceProblem ?? this.serviceProblem,
      othersProblem: othersProblem ?? this.othersProblem,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'carService': carService,
      'vendor': vendor,
      'serviceProblem': serviceProblem.map((x) => x.toMap()).toList(),
      'othersProblem': othersProblem,
    };
  }

  Map<String, dynamic> toWithoutOtherMap() {
    return {
      'carService': carService,
      'vendor': vendor,
      'serviceProblem': serviceProblem.map((x) => x.toMap()).toList(),
    };
  }

  factory VendorProblemSubmitBody.fromMap(Map<String, dynamic> map) {
    return VendorProblemSubmitBody(
      carService: map['carService'] ?? '',
      vendor: map['vendor'] ?? '',
      serviceProblem: List<ServiceProblem>.from(
          map['serviceProblem']?.map((x) => ServiceProblem.fromMap(x)) ??
              const []),
      othersProblem: map['othersProblem'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VendorProblemSubmitBody.fromJson(String source) =>
      VendorProblemSubmitBody.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VendorProblemSubmitBody(carService: $carService, vendor: $vendor, serviceProblem: $serviceProblem, othersProblem: $othersProblem)';
  }

  @override
  List<Object> get props => [carService, vendor, serviceProblem, othersProblem];
}

class ServiceProblem extends Equatable {
  final String problem;
  final String amount;
  const ServiceProblem({
    required this.problem,
    required this.amount,
  });

  ServiceProblem copyWith({
    String? problem,
    String? amount,
  }) {
    return ServiceProblem(
      problem: problem ?? this.problem,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'problem': problem,
      'amount': amount,
    };
  }

  factory ServiceProblem.fromMap(Map<String, dynamic> map) {
    return ServiceProblem(
      problem: map['problem'] ?? '',
      amount: map['amount'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceProblem.fromJson(String source) =>
      ServiceProblem.fromMap(json.decode(source));

  @override
  String toString() => 'ServiceProblem(problem: $problem, amount: $amount)';

  @override
  List<Object> get props => [problem, amount];
}
