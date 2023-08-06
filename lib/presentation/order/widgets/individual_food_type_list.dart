import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/cart/cart_provider.dart';
import '../../../domain/cart/all_products_response.dart';
import '../../../domain/cart/model/food_item_mode.dart';
import '../../../utils/utils.dart';

final combinedList = ValueNotifier(all_products);

class IndividualFoodTypeList extends HookConsumerWidget {
  const IndividualFoodTypeList({
    super.key,
    required this.typedFoodList,
    required this.totalSelectedCalorie,
    required this.titleCalorie,
    required this.categoryId,
  });

  final List<FoodItemModel> typedFoodList;
  final double totalSelectedCalorie;
  final double titleCalorie;
  final String categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);

    final filteredSelectedItems = cartState.selectedFoodItems
        .filter((t) => t.category == categoryId)
        .toIList();

    final totalSelectedCalorie = useMemoized(
      () => filteredSelectedItems.isNotEmpty
          ? filteredSelectedItems
              .map((e) =>
                  e.caloriesPerHundredGram.toDouble() * (e.quantity / 100))
              .reduce((value, element) => value + element)
          : 0.0,
      [cartState.selectedFoodItems],
    );

    final isOverCalorie = useMemoized<bool>(() {
      return totalSelectedCalorie > titleCalorie;
    }, [cartState.selectedFoodItems]);

    return SizedBox(
        height: .8.sh,
        child: CustomScrollView(
          slivers: [
            // SliverAnimatedOpacity(
            //   opacity: isOverCalorie ? 1 : 0,
            //   duration: const Duration(milliseconds: 300),
            //   sliver: SliverPersistentHeader(
            //     delegate: _ShowNotification(isOverCalorie),
            //     pinned: true,
            //     floating: true,
            //   ),
            // ),
            SliverVisibility(
              visible: typedFoodList.isNotEmpty,
              replacementSliver: SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: paddingTop30,
                    child:
                        const Text("No Item available to your chosen vendor!"),
                  ),
                ),
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: typedFoodList.length,
                  (context, index) {
                    final item = typedFoodList[index];
                    final isSelected = cartState.selectedFoodItems
                        .map((element) => element.id)
                        .contains(item.id);
                    final selectedItem = cartState.selectedFoodItems
                        .where((element) => element.id == item.id)
                        .firstOrNull;

                    return _FoodItemTile(
                      item: item,
                      isOverCalorie: isOverCalorie,
                      selectedItem: selectedItem,
                      isSelected: isSelected,
                    );
                  },
                ),
              ),
            )
          ],
        ));
  }
}


class _FoodItemTile extends HookConsumerWidget {
  const _FoodItemTile({
    required this.item,
    required this.isOverCalorie,
    required this.selectedItem,
    required this.isSelected,
  });

  final FoodItemModel item;
  final bool isOverCalorie;
  final FoodItemModel? selectedItem;
  final bool isSelected;

  @override
  Widget build(BuildContext context, ref) {
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
      trailing: _CartStepper(
        isOverCalorie: isOverCalorie,
        quantity: selectedItem?.quantity ?? 0.0,
        onAdd: () {
          if (!isSelected) {
            ref.read(cartProvider.notifier).addToCart(item.copyWith(
                  quantity: 100.0,
                ));
          } else {
            ref.read(cartProvider.notifier).updateCartItem(
                  selectedItem!
                      .copyWith(quantity: selectedItem!.quantity + 100),
                );
          }
        },
        onRemove: isSelected
            ? () {
                if (isSelected) {
                  if (selectedItem!.quantity > 100) {
                    ref.read(cartProvider.notifier).updateCartItem(
                          selectedItem!.copyWith(
                            quantity: selectedItem!.quantity - 100,
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
  }
}

class _CartStepper extends HookConsumerWidget {
  const _CartStepper({
    Key? key,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
    required this.isOverCalorie,
  }) : super(key: key);

  final double quantity;
  final Function()? onAdd;
  final Function()? onRemove;
  final bool isOverCalorie;

  @override
  Widget build(BuildContext context, ref) {
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
                backgroundColor:
                    isOverCalorie ? ColorPalate.error : ColorPalate.primary,
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
