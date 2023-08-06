import 'package:be_gelled/presentation/order/select_package_screen.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/cart/cart_provider.dart';
import '../../../domain/cart/model/food_item_mode.dart';
import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';
import 'individual_food_type_list.dart';

class PackageTile<T> extends HookConsumerWidget {
  const PackageTile({
    Key? key,
    required this.foodType,
    required this.titleCalorie,
    required this.items,
    this.border,
    this.backgroundColor,
    this.headTextStyle,
  }) : super(key: key);

  final FoodType foodType;
  final double titleCalorie;
  final List<FoodItemModel> items;
  // final double totalSelectedCalorie;
  // final IList<FoodItemModel> items;

  final BoxBorder? border;
  final Color? backgroundColor;
  final TextStyle? headTextStyle;

  @override
  Widget build(BuildContext context, ref) {
    final cartState = ref.watch(cartProvider);

    final filteredSelectedItems = cartState.selectedFoodItems
        .filter((t) => t.category == foodType.categoryId)
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
      Logger.d(
          "$totalSelectedCalorie $titleCalorie ${totalSelectedCalorie > titleCalorie}");
      return totalSelectedCalorie > titleCalorie;
    }, [cartState.selectedFoodItems]);

    return KContainer(
      border: filteredSelectedItems.isEmpty ? const Border() : border,
      backgroundColor: backgroundColor,
      padding: filteredSelectedItems.isEmpty ? padding0 : null,
      child: Column(
        children: [
          _tile(
            title: foodType.name,
            amount: titleCalorie.toStringAsFixed(1),
            isHead: true,
            headTextStyle: CustomTextStyle.textStyle14w600Orange.copyWith(
                color: filteredSelectedItems.isEmpty
                    ? ColorPalate.primary
                    : isOverCalorie
                        ? ColorPalate.error
                        : ColorPalate.secondary,
                decoration: isOverCalorie ? TextDecoration.underline : null),
          ),

          ...List.generate(filteredSelectedItems.length, (index) {
            final item = filteredSelectedItems[index];
            return _tile(
              title: item.name,
              amount: (item.caloriesPerHundredGram * (item.quantity / 100))
                  .toStringAsFixed(1),
            );
          }),
          // _tile(
          //   title: "Fish (Hilsha Fish)",
          //   price: "800 gm",
          // ),
          // gap4,
          // _tile(
          //   title: "Red Spinach",
          //   price: "200 gm",
          // ),
          // gap4,
          // _tile(
          //   title: "Sugar ",
          //   price: "500 gm",
          // ),
          // gap4,
          // _tile(
          //   title: "Chicken (Layer) ",
          //   price: "1 kg",
          // ),
        ],
      ),
      onTap: () => showCustomSheet(
        context: context,
        builder: (context) {
          return IndividualFoodTypeList(
            typedFoodList: items,
            totalSelectedCalorie: totalSelectedCalorie,
            titleCalorie: titleCalorie,
            categoryId: foodType.categoryId,
          );
        },
      ),
    );
  }

  Widget _tile({
    required String title,
    required String amount,
    bool isHead = false,
    TextStyle? headTextStyle,
    bool haveListItems = false,
  }) {
    return Padding(
      padding: haveListItems
          ? padding0
          : isHead
              ? paddingBottom8
              : paddingBottom4,
      child: Row(
        mainAxisAlignment: mainSpaceBetween,
        children: [
          Text(
            title,
            style: isHead
                ? CustomTextStyle.textStyle14w600
                : CustomTextStyle.textStyle12w400HG800,
          ),
          Text(
            amount,
            style:
                isHead ? headTextStyle : CustomTextStyle.textStyle12w500HG800,
          ),
        ],
      ),
    );
  }
}
