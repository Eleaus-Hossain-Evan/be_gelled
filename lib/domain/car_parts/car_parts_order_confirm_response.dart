import 'dart:convert';

import 'package:equatable/equatable.dart';

class CarPartsOrderConfirmResponse extends Equatable {
  final CarPartsOderConfirmModel data;
  final bool success;
  final String message;

  const CarPartsOrderConfirmResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  CarPartsOrderConfirmResponse copyWith({
    CarPartsOderConfirmModel? data,
    bool? success,
    String? message,
  }) {
    return CarPartsOrderConfirmResponse(
      data: data ?? this.data,
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.toMap(),
      'success': success,
      'message': message,
    };
  }

  factory CarPartsOrderConfirmResponse.fromMap(Map<String, dynamic> map) {
    return CarPartsOrderConfirmResponse(
      data: map['data']
          ? CarPartsOderConfirmModel.init()
          : CarPartsOderConfirmModel.fromMap(map['data']),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CarPartsOrderConfirmResponse.fromJson(String source) =>
      CarPartsOrderConfirmResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'CarPartsOrderResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];
}

class CarPartsOderConfirmModel extends Equatable {
  final String myParts;
  final String vendor;
  final String parts;
  final String identificationNumber;
  final String amount;
  final String image;
  final String car;
  final String details;
  final String type;
  final String orderId;
  final String customer;
  final String customerAmount;
  final String finalAmount;
  final bool orderAcceptByVendor;
  final int state;
  final int deliveryType;
  final int paymentType;
  final int deliveryCharge;
  final int paymentStatus;
  final int totalBill;
  final int totalReceivedBill;
  final String id;
  final String createdAt;
  final String updatedAt;

  factory CarPartsOderConfirmModel.init() => const CarPartsOderConfirmModel(
        myParts: '',
        vendor: '',
        parts: '',
        identificationNumber: '',
        amount: '',
        image: '',
        car: '',
        details: '',
        type: '',
        orderId: '',
        customer: '',
        customerAmount: '',
        finalAmount: '',
        orderAcceptByVendor: false,
        state: 0,
        deliveryType: 0,
        paymentType: 0,
        deliveryCharge: 0,
        paymentStatus: 0,
        totalBill: 0,
        totalReceivedBill: 0,
        id: '',
        createdAt: '',
        updatedAt: '',
      );

  const CarPartsOderConfirmModel({
    required this.myParts,
    required this.vendor,
    required this.parts,
    required this.identificationNumber,
    required this.amount,
    required this.image,
    required this.car,
    required this.details,
    required this.type,
    required this.orderId,
    required this.customer,
    required this.customerAmount,
    required this.finalAmount,
    required this.orderAcceptByVendor,
    required this.state,
    required this.deliveryType,
    required this.paymentType,
    required this.deliveryCharge,
    required this.paymentStatus,
    required this.totalBill,
    required this.totalReceivedBill,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  CarPartsOderConfirmModel copyWith({
    String? myParts,
    String? vendor,
    String? parts,
    String? identificationNumber,
    String? amount,
    String? image,
    String? car,
    String? details,
    String? type,
    String? orderId,
    String? customer,
    String? customerAmount,
    String? finalAmount,
    bool? orderAcceptByVendor,
    int? state,
    int? deliveryType,
    int? paymentType,
    int? deliveryCharge,
    int? paymentStatus,
    int? totalBill,
    int? totalReceivedBill,
    String? id,
    String? createdAt,
    String? updatedAt,
  }) {
    return CarPartsOderConfirmModel(
      myParts: myParts ?? this.myParts,
      vendor: vendor ?? this.vendor,
      parts: parts ?? this.parts,
      identificationNumber: identificationNumber ?? this.identificationNumber,
      amount: amount ?? this.amount,
      image: image ?? this.image,
      car: car ?? this.car,
      details: details ?? this.details,
      type: type ?? this.type,
      orderId: orderId ?? this.orderId,
      customer: customer ?? this.customer,
      customerAmount: customerAmount ?? this.customerAmount,
      finalAmount: finalAmount ?? this.finalAmount,
      orderAcceptByVendor: orderAcceptByVendor ?? this.orderAcceptByVendor,
      state: state ?? this.state,
      deliveryType: deliveryType ?? this.deliveryType,
      paymentType: paymentType ?? this.paymentType,
      deliveryCharge: deliveryCharge ?? this.deliveryCharge,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      totalBill: totalBill ?? this.totalBill,
      totalReceivedBill: totalReceivedBill ?? this.totalReceivedBill,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'myParts': myParts,
      'vendor': vendor,
      'parts': parts,
      'identificationNumber': identificationNumber,
      'amount': amount,
      'image': image,
      'car': car,
      'details': details,
      'type': type,
      'orderId': orderId,
      'customer': customer,
      'customerAmount': customerAmount,
      'finalAmount': finalAmount,
      'orderAcceptByVendor': orderAcceptByVendor,
      'state': state,
      'deliveryType': deliveryType,
      'paymentType': paymentType,
      'deliveryCharge': deliveryCharge,
      'paymentStatus': paymentStatus,
      'totalBill': totalBill,
      'totalReceivedBill': totalReceivedBill,
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory CarPartsOderConfirmModel.fromMap(Map<String, dynamic> map) {
    return CarPartsOderConfirmModel(
      id: map['_id'] ?? '',
      myParts: map['myParts'] ?? '',
      vendor: map['vendor'] ?? '',
      parts: map['parts'] ?? '',
      identificationNumber: map['identificationNumber'] ?? '',
      amount: map['amount'] ?? '',
      image: map['image'] ?? '',
      car: map['car'] ?? '',
      details: map['details'] ?? '',
      type: map['type'] ?? '',
      orderId: map['orderId'] ?? '',
      customer: map['customer'] ?? '',
      customerAmount: map['customerAmount'] ?? '',
      finalAmount: map['finalAmount'] ?? '',
      orderAcceptByVendor: map['orderAcceptByVendor'] ?? false,
      state: map['state']?.toInt() ?? 0,
      deliveryType: map['deliveryType']?.toInt() ?? 0,
      paymentType: map['paymentType']?.toInt() ?? 0,
      deliveryCharge: map['deliveryCharge']?.toInt() ?? 0,
      paymentStatus: map['paymentStatus']?.toInt() ?? 0,
      totalBill: map['totalBill']?.toInt() ?? 0,
      totalReceivedBill: map['totalReceivedBill']?.toInt() ?? 0,
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CarPartsOderConfirmModel.fromJson(String source) =>
      CarPartsOderConfirmModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CarPartsOderConfirmModel(myParts: $myParts, vendor: $vendor, parts: $parts, identificationNumber: $identificationNumber, amount: $amount, image: $image, car: $car, details: $details, type: $type, orderId: $orderId, customer: $customer, customerAmount: $customerAmount, finalAmount: $finalAmount, orderAcceptByVendor: $orderAcceptByVendor, state: $state, deliveryType: $deliveryType, paymentType: $paymentType, deliveryCharge: $deliveryCharge, paymentStatus: $paymentStatus, totalBill: $totalBill, totalReceivedBill: $totalReceivedBill, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  List<Object> get props {
    return [
      myParts,
      vendor,
      parts,
      identificationNumber,
      amount,
      image,
      car,
      details,
      type,
      orderId,
      customer,
      customerAmount,
      finalAmount,
      orderAcceptByVendor,
      state,
      deliveryType,
      paymentType,
      deliveryCharge,
      paymentStatus,
      totalBill,
      totalReceivedBill,
      id,
      createdAt,
      updatedAt,
    ];
  }
}
