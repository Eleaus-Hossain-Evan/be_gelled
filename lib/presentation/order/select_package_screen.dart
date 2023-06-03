import 'dart:developer';

import 'package:be_gelled/domain/cart/all_products_response.dart';
import 'package:be_gelled/domain/cart/model/food_item_mode.dart';
import 'package:be_gelled/utils/utils.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/cart/cart_provider.dart';
import '../../domain/cart/model/calorie_model.dart';
import '../widgets/widgets.dart';
import 'order_details_screen.dart';
import 'widgets/individual_food_type_list.dart';
import 'widgets/package_tile.dart';

final calorie = CalorieModel.fromMap(const {
  "totalCalorie": 2027.7767599999997,
  "totalDairy": 203,
  "totalFruitsAndVegetables": 1014,
  "totalGrains": 507,
  "totalProteins": 305
});

final class SelectPackageScreen extends HookConsumerWidget {
  static const String route = '/select-package';
  const SelectPackageScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);
    final selectedDairy = useState<List<FoodItemModel>>([]);

    useEffect(() {
      // log(selectedDairy.value.toString());
      Logger.d(calorie.toMap().values.toList());
      Logger.d(calorie.toMap().keys.toList());
      return null;
    }, [selectedDairy.value]);

    return Scaffold(
      appBar: const KAppBar(
        titleText: 'Select Package',
      ),
      body: SingleChildScrollView(
        padding: padding16,
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Text(
              "Packages suggestion for you",
              style: CustomTextStyle.textStyle16w600HG1000,
            ),
            gap8,
            Text(
              "6 packages are suggested for you, you can also customised them as you need.",
              style: CustomTextStyle.textStyle13w400HG800,
            ),
            gap16,

            Row(
              mainAxisAlignment: mainSpaceBetween,
              children: [
                Text(
                  "Total Calorie:",
                  style: CustomTextStyle.textStyle16w600HG1000,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: ColorPalate.secondary,
                    borderRadius: radius6,
                  ),
                  child: Text(
                    calorie.totalCalorie.toStringAsFixed(2),
                    style: CustomTextStyle.textStyle16w600White,
                  ),
                ),
              ],
            ),
            gap12,
            PackageTile(
              title: "Dairy",
              titleCalorie: "${calorie.totalDairy} cal",
              items: cartState.selectedFoodItems
                  .filter(
                      (t) => t.category == all_products.dairy.first.category)
                  .toIList(),
              onTap: () {
                showCustomSheet(
                  context: context,
                  builder: (context) {
                    return IndividualFoodTypeList(
                      typedFoodList: all_products.dairy,
                    );
                  },
                );
              },
            ),
            gap12,
            PackageTile(
              title: "FruitsAndVegetables",
              titleCalorie: "${calorie.totalFruitsAndVegetables} cal",
              items: cartState.selectedFoodItems
                  .filter((t) =>
                      t.category ==
                      all_products.fruitsAndVegetables.first.category)
                  .toIList(),
              onTap: () {
                showCustomSheet(
                  context: context,
                  builder: (context) {
                    return IndividualFoodTypeList(
                      typedFoodList: all_products.fruitsAndVegetables,
                    );
                  },
                );
              },
            ),
            gap12,
            PackageTile(
              title: "Grains",
              titleCalorie: "${calorie.totalGrains} cal",
              items: cartState.selectedFoodItems
                  .filter(
                      (t) => t.category == all_products.grains.first.category)
                  .toIList(),
              onTap: () {
                showCustomSheet(
                  context: context,
                  builder: (context) {
                    return IndividualFoodTypeList(
                      typedFoodList: all_products.grains,
                    );
                  },
                );
              },
            ),
            gap12,
            PackageTile(
              title: "Proteins",
              titleCalorie: "${calorie.totalProteins} cal",
              items: cartState.selectedFoodItems
                  .filter(
                      (t) => t.category == all_products.protein.first.category)
                  .toIList(),
              onTap: () {
                showCustomSheet(
                  context: context,
                  builder: (context) {
                    return IndividualFoodTypeList(
                      typedFoodList: all_products.protein,
                    );
                  },
                );
              },
            ),

//' Previous code commented

            // KListViewSeparated(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   separator: gap16,
            //   itemBuilder: (context, index) => PackageTile(
            //     model: packageList[index],
            //     onTap: () {
            //       showCustomSheet(
            //         context: context,
            //         builder: (context) => PackageCustomization(
            //           model: packageList[index],
            //         ),
            //       );
            //     },
            //   ),
            //   itemCount: packageList.length,
            // )

            // ...List.generate(calorie.toMap().values.length, (index) {
            //   if (index == 0) {
            //     return Row(
            //       mainAxisAlignment: mainSpaceBetween,
            //       children: [
            //         Text(
            //           "Total Calorie:",
            //           style: CustomTextStyle.textStyle16w600HG1000,
            //         ),
            //         Container(
            //           padding:
            //               EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            //           decoration: BoxDecoration(
            //             color: ColorPalate.secondary,
            //             borderRadius: radius6,
            //           ),
            //           child: Text(
            //             calorie.totalCalorie.toStringAsFixed(2),
            //             style: CustomTextStyle.textStyle16w600White,
            //           ),
            //         ),
            //       ],
            //     );
            //   }
            //   return PackageTile(
            //     title: calorie.toMap().keys.toList()[index].toWordTitleCase(),
            //     titleCalorie: calorie.toMap().values.toList()[index].toString(),
            //     items: cartState.selectedFoodItems.unlock,
            //     onTap: () {
            //       showCustomSheet(
            //         context: context,
            //         builder: (context) {
            //           return const IndividualFoodTypeList();
            //         },
            //       );
            //     },
            //   );
            // })
            // gap12,
            // PackageTile(
            //   title: "FruitsAndVegetables",
            //   titleCalorie: calorie.totalFruitsAndVegetables.toString(),
            //   items: selectedDairy.value,
            //   onTap: () {
            //     showCustomSheet(
            //       context: context,
            //       builder: (context) {
            //         //   return PackageCustomization(
            //         //   model: packageList[index],
            //         // );

            //         return Container();
            //       },
            //     );
            //   },
            // ),
            // gap12,
            // PackageTile(
            //   title: "Grains",
            //   titleCalorie: calorie.totalGrains.toString(),
            //   items: selectedDairy.value,
            //   onTap: () {
            //     showCustomSheet(
            //       context: context,
            //       builder: (context) {
            //         //   return PackageCustomization(
            //         //   model: packageList[index],
            //         // );

            //         return Container();
            //       },
            //     );
            //   },
            // ),
            // gap12,
            // PackageTile(
            //   title: "Proteins",
            //   titleCalorie: calorie.totalProteins.toString(),
            //   items: selectedDairy.value,
            //   onTap: () {
            //     showCustomSheet(
            //       context: context,
            //       builder: (context) {
            //         //   return PackageCustomization(
            //         //   model: packageList[index],
            //         // );

            //         return Container();
            //       },
            //     );
            //   },
            // ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: paddingTop16.add(paddingH16),
        child: FilledButton(
          onPressed: () {
            context.push(OrderDetailsScreen.route);
          },
          child: Text(context.local.continueText),
        ),
      ),
    );
  }
}
