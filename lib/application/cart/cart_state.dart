
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

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
        items: const IListConst([]),
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

final cartItems = [];
