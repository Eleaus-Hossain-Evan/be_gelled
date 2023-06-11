import 'package:equatable/equatable.dart';

import '../auth/model/address_info.dart';
import 'model/food_item_mode.dart';

class OrderBody extends Equatable {
  final String vendor;
  final String customer;
  final AddressInfo addressInfo;
  final List<FoodItemModel> products;
  final int total;
  final int discount;
  final int paymentType;
  final int deliveryCharge;
  final List<String> weekDays;
  final String coupon;

  const OrderBody({
    required this.vendor,
    required this.customer,
    required this.addressInfo,
    required this.products,
    required this.total,
    required this.discount,
    required this.paymentType,
    required this.deliveryCharge,
    required this.weekDays,
    required this.coupon,
  });

  OrderBody copyWith({
    String? vendor,
    String? customer,
    AddressInfo? addressInfo,
    List<FoodItemModel>? products,
    int? total,
    int? discount,
    int? paymentType,
    int? deliveryCharge,
    List<String>? weekDays,
    String? coupon,
  }) {
    return OrderBody(
      vendor: vendor ?? this.vendor,
      customer: customer ?? this.customer,
      addressInfo: addressInfo ?? this.addressInfo,
      products: products ?? this.products,
      total: total ?? this.total,
      discount: discount ?? this.discount,
      paymentType: paymentType ?? this.paymentType,
      deliveryCharge: deliveryCharge ?? this.deliveryCharge,
      weekDays: weekDays ?? this.weekDays,
      coupon: coupon ?? this.coupon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'vendor': vendor,
      'customer': customer,
      'addressInfo': addressInfo.toMap(),
      'products': products.map((x) => x.toMap()).toList(),
      'total': total,
      'discount': discount,
      'paymentType': paymentType,
      'deliveryCharge': deliveryCharge,
      'weekDays': weekDays,
      'coupon': coupon,
    };
  }

  factory OrderBody.fromMap(Map<String, dynamic> map) {
    return OrderBody(
      vendor: map['vendor'] ?? '',
      customer: map['customer'] ?? '',
      addressInfo: AddressInfo.fromMap(map['addressInfo']),
      products: List<FoodItemModel>.from(
          map['products']?.map((x) => FoodItemModel.fromMap(x)) ?? const []),
      total: map['total']?.toInt() ?? 0,
      discount: map['discount']?.toInt() ?? 0,
      paymentType: map['paymentType']?.toInt() ?? 0,
      deliveryCharge: map['deliveryCharge']?.toInt() ?? 0,
      weekDays: List<String>.from(map['weekDays'] ?? const []),
      coupon: map['coupon'] ?? '',
    );
  }

  @override
  String toString() {
    return 'OrderBody(vendor: $vendor, customer: $customer, addressInfo: $addressInfo, products: $products, total: $total, discount: $discount, paymentType: $paymentType, deliveryCharge: $deliveryCharge, weekDays: $weekDays, coupon: $coupon)';
  }

  @override
  List<Object> get props {
    return [
      vendor,
      customer,
      addressInfo,
      products,
      total,
      discount,
      paymentType,
      deliveryCharge,
      weekDays,
      coupon,
    ];
  }
}
