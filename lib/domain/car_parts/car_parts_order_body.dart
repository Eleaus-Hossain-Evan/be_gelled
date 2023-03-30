import 'dart:convert';

import 'package:equatable/equatable.dart';

class CarPartsOrderBody extends Equatable {
  final String id;
  final String amount;
  final int deliveryType;
  final int paymentType;
  final int deliveryCharge;
  const CarPartsOrderBody({
    required this.id,
    required this.amount,
    required this.deliveryType,
    required this.paymentType,
    required this.deliveryCharge,
  });

  CarPartsOrderBody copyWith({
    String? id,
    String? amount,
    int? deliveryType,
    int? paymentType,
    int? deliveryCharge,
  }) {
    return CarPartsOrderBody(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      deliveryType: deliveryType ?? this.deliveryType,
      paymentType: paymentType ?? this.paymentType,
      deliveryCharge: deliveryCharge ?? this.deliveryCharge,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'deliveryType': deliveryType,
      'paymentType': paymentType,
      'deliveryCharge': deliveryCharge,
    };
  }

  factory CarPartsOrderBody.fromMap(Map<String, dynamic> map) {
    return CarPartsOrderBody(
      id: map['id'] ?? '',
      amount: map['amount'] ?? '',
      deliveryType: map['deliveryType']?.toInt() ?? 0,
      paymentType: map['paymentType']?.toInt() ?? 0,
      deliveryCharge: map['deliveryCharge']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarPartsOrderBody.fromJson(String source) =>
      CarPartsOrderBody.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CarPartsOderBody(id: $id, amount: $amount, deliveryType: $deliveryType, paymentType: $paymentType, deliveryCharge: $deliveryCharge)';
  }

  @override
  List<Object> get props {
    return [
      id,
      amount,
      deliveryType,
      paymentType,
      deliveryCharge,
    ];
  }
}
