import 'package:be_gelled/domain/cart/calorie_suggestion_response.dart';

import '../domain/cart/all_products_response.dart';
import '../domain/cart/order_body.dart';
import '../domain/cart/order_response.dart';
import '../utils/utils.dart';

class CartRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, CalorieSuggestionResponse>>
      getCalorieSuggestion() async {
    return await api.get(
      endPoint: APIRoute.SUGGESTION,
      fromData: (json) => CalorieSuggestionResponse.fromMap(json),
    );
  }

  Future<Either<CleanFailure, AllProductsResponse>>
      getProductGroupByCategory() async {
    return await api.get(
      endPoint: APIRoute.PRODUCT_BY_CATEGORY,
      fromData: (json) => AllProductsResponse.fromMap(json),
    );
  }

  Future<Either<CleanFailure, OrderResponse>> placeOrder(OrderBody body) async {
    return await api.post(
      endPoint: APIRoute.ORDER_CREATE,
      body: body.toMap(),
      fromData: (json) => OrderResponse.fromMap(json),
      withToken: true,
    );

    // Logger.v("data: $data");

    // return data.fold((l) {
    //   final error = jsonDecode(l.error);
    //   final failure = l.copyWith(error: error['error']["message"]);
    //   return left(failure);
    // }, (r) => right(r));
  }
}
