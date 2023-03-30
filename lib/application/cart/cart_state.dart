import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../domain/car_parts/model/car_parts_model.dart';
import '../../domain/cart/model/address_model.dart';
import '../../domain/cart/model/cart_model.dart';
import '../../domain/cart/model/my_bids_model.dart';
import '../../utils/network_util/network_failure.dart';

class CartState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final IList<CartModel> items;
  final IList<MyBidsModel> myBids;
  final AddressModel address;

  const CartState({
    required this.loading,
    required this.failure,
    required this.items,
    required this.myBids,
    required this.address,
  });

  factory CartState.init() => CartState(
        loading: false,
        failure: CleanFailure.none(),
        items: cartItems.lock,
        myBids: const IListConst([]),
        address: AddressModel.init(),
      );

  CartState copyWith({
    bool? loading,
    CleanFailure? failure,
    IList<CartModel>? items,
    IList<MyBidsModel>? myBids,
    AddressModel? address,
  }) {
    return CartState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      items: items ?? this.items,
      myBids: myBids ?? this.myBids,
      address: address ?? this.address,
    );
  }

  @override
  String toString() {
    return 'CartState(loading: $loading, failure: $failure, items: $items, myBids: $myBids, address: $address)';
  }

  @override
  List<Object> get props {
    return [
      loading,
      failure,
      items,
      myBids,
      address,
    ];
  }
}

final cartItems = [
  CartModel(
    isSelected: false,
    quantity: 1,
    product: CarPartsModel.fromMap(const {
      "_id": "640381c7a42596a61a1e8823",
      "vendor": {
        "_id": "63b456f25c62bd716fce1f2c",
        "name": "abc",
        "phone": "542147",
        "profilePicture":
            "https://car-service-dynamic.s3.amazonaws.com/4097401676271068752vendor-logo-png-transparent.png",
        "companyName": "test",
        "nameInArabic": "مرحبا عزيزى"
      },
      "parts": {
        "_id": "6400ede62b0b21e722ba55e4",
        "name": "Handle Gears",
        "nameInArabic": "مرحبا عزيزى"
      },
      "identificationNumber": "nur-vendor-105",
      "amount": 750,
      "image": "https://m.media-amazon.com/images/I/61GA-IKfrsL._AC_SX569_.jpg",
      "car": {
        "_id": "63e87f18a73c33c2cad7014e",
        "year": "2023",
        "carName": "BMW",
        "carModel": "23CM",
        "subModel": "255-hp",
        "engine": "2.0L in-line 4 DOHC",
        "image":
            "https://car-service-dynamic.s3.amazonaws.com/311243167618127183914999_cc1280_032_A96.png",
        "color": "Blue",
        "details": ""
      },
      "details": "Good parts",
      "type": "new",
      "averageRating": 0,
      "totalSold": 0
    }),
  )
];
