import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/cart/cart_provider.dart';
import '../../../domain/order/all_products_response.dart';
import '../../../utils/utils.dart';

final combinedList = ValueNotifier(all_products);

class IndividualFoodTypeList extends HookConsumerWidget {
  const IndividualFoodTypeList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return SizedBox(
      height: .8.sh,
      child: ListView.builder(
        itemCount: cart.allTypedFoods.dairy.length,
        itemBuilder: (context, index) {
          final item = all_products.dairy[index];
          final isSelected = cart.selectedFoodItems
              .map((element) => element.id)
              .contains(item.id);
          final selectedItem = cart.selectedFoodItems
              .where(
                (element) => element.id == item.id,
              )
              .firstOrNull;

          return ListTile(
            title: Text(
              item.name,
              style: CustomTextStyle.textStyle16w600HG800,
            ),
            subtitle: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: item.caloriesPerHundredGram.toString(),
                    style: CustomTextStyle.textStyle14w600Orange,
                  ),
                  TextSpan(
                    text: " Cal per 100gm",
                    style: CustomTextStyle.textStyle12w400HG800,
                  ),
                ],
              ),
            ),
            trailing: CartStepper(
              quantity: selectedItem?.quantity ?? 0.0,
              onAdd: () {
                if (!isSelected) {
                  ref.read(cartProvider.notifier).addToCart(item.copyWith(
                        quantity: 100.0,
                      ));
                } else {
                  ref.read(cartProvider.notifier).updateCartItem(
                        selectedItem!
                            .copyWith(quantity: selectedItem.quantity + 100),
                      );
                }
              },
              onRemove: isSelected
                  ? () {
                      if (isSelected) {
                        if (selectedItem!.quantity > 100) {
                          ref.read(cartProvider.notifier).updateCartItem(
                                selectedItem.copyWith(
                                  quantity: selectedItem.quantity - 100,
                                ),
                              );
                        } else {
                          ref.read(cartProvider.notifier).removeFromCart(item);
                        }
                      }
                    }
                  : null,
            ),
          );
        },
      ),
    );
  }
}

class CartStepper extends StatelessWidget {
  const CartStepper({
    super.key,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  final double quantity;
  final Function()? onAdd;
  final Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: .4.sw,
      child: Row(
        mainAxisAlignment: mainSpaceBetween,
        mainAxisSize: mainMax,
        children: [
          SizedBox(
            height: 32.w,
            width: 32.w,
            child: FilledButton(
              onPressed: onRemove,
              style: FilledButton.styleFrom(
                backgroundColor: ColorPalate.primary,
                foregroundColor: ColorPalate.white,
                disabledBackgroundColor: ColorPalate.white,
                disabledForegroundColor: ColorPalate.black,
                padding: padding0,
                shape: RoundedRectangleBorder(
                  borderRadius: radius8,
                ),
                side: const BorderSide(
                  color: ColorPalate.spaceScape100,
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.remove,
                size: 18.w,
              ),
            ),
          ),
          Text(
            quantity.toWeightString(),
            style: CustomTextStyle.textStyle14w500HG1000,
          ),
          SizedBox(
            height: 32.w,
            width: 32.w,
            child: FilledButton(
              onPressed: onAdd,
              style: FilledButton.styleFrom(
                backgroundColor: ColorPalate.primary,
                foregroundColor: ColorPalate.white,
                disabledBackgroundColor: ColorPalate.white,
                disabledForegroundColor: ColorPalate.black,
                padding: padding0,
                shape: RoundedRectangleBorder(
                  borderRadius: radius8,
                ),
                side: const BorderSide(
                  color: ColorPalate.spaceScape100,
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.add,
                size: 18.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
