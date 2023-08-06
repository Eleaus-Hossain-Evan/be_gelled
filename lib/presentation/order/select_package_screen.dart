import 'package:be_gelled/domain/cart/model/food_item_mode.dart';
import 'package:be_gelled/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/cart/cart_provider.dart';
import '../widgets/widgets.dart';
import 'order_details_screen.dart';
import 'widgets/package_tile.dart';

enum FoodType {
  fruitsAndVegetables('6466bfe8e62de0ed60e53933'),
  grains('6466bfe8e62de0ed60e53937'),
  protein('6466bfe8e62de0ed60e53934'),
  dairy('6466bfe8e62de0ed60e53936'),
  beverages(''),
  oil('6466bfe8e62de0ed60e5393a');

  final String categoryId;
  const FoodType(this.categoryId);
}

final class SelectPackageScreen extends HookConsumerWidget {
  static const String route = '/select-package';
  const SelectPackageScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = useState<bool>(false);
    final cartState = ref.watch(cartProvider);

    final calorie = cartState.calorieModel;
    final selectedDairy = useState<List<FoodItemModel>>([]);

    // ref.listen(cartProvider, (previous, next) {
    //   if (previous!.loading == false && next.loading) {
    //     BotToast.showLoading();
    //   }
    //   if (previous.loading == true && next.loading == false) {
    //     BotToast.closeAllLoading();
    //   }
    // });

    useEffect(() {
      // // log(selectedDairy.value.toString());
      // Logger.d(calorie.toMap().values.toList());
      // Logger.d(calorie.toMap().keys.toList());
      loading.value = true;

      Future.wait([
        Future.microtask(
            () => ref.read(cartProvider.notifier).getCalorieSuggestion()),
        Future.microtask(
            () => ref.read(cartProvider.notifier).getProductGroupByCategory()),
      ]).then((value) => loading.value = false);
      return null;
    }, [selectedDairy.value]);

    return KLoadingScaffold(
      loading: loading.value,
      loader: true,
      appBar: KAppBar(
        titleText: context.local.selectPackage,
      ),
      body: SingleChildScrollView(
        padding: padding16,
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Text(
              context.local.packagesSuggestionForYou,
              style: CustomTextStyle.textStyle16w600HG1000,
            ),
            gap8,
            Text(
              context.local
                  .packagesAreSuggestedForYouCanAlsoCustomizedThemAsYouNeed(6),
              style: CustomTextStyle.textStyle13w400HG800,
            ),
            gap16,

            Row(
              mainAxisAlignment: mainSpaceBetween,
              children: [
                Text(
                  context.local.totalCalorie,
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
              foodType: FoodType.fruitsAndVegetables,
              titleCalorie: calorie.totalFruitsAndVegetables,
              items: cartState.allTypedFoods.fruitsAndVegetables,
            ),
            gap12,
            PackageTile(
              foodType: FoodType.grains,
              titleCalorie: calorie.totalGrains,
              items: cartState.allTypedFoods.grains,
            ),
            gap12,
            PackageTile(
              foodType: FoodType.protein,
              titleCalorie: calorie.totalProteins,
              items: cartState.allTypedFoods.protein,
            ),
            gap12,
            PackageTile(
              foodType: FoodType.dairy,
              titleCalorie: calorie.totalDairy,
              items: cartState.allTypedFoods.dairy,
            ),
            gap12,
            PackageTile(
              foodType: FoodType.beverages,
              titleCalorie: calorie.totalDairy,
              items: cartState.allTypedFoods.beverages,
            ),
            gap12,
            PackageTile(
              foodType: FoodType.oil,
              titleCalorie: calorie.totalDairy,
              items: cartState.allTypedFoods.oil,
            ),
            // gap12,
            // PackageTile(
            //   title: "FruitsAndVegetables",
            //   titleCalorie: calorie.totalFruitsAndVegetables,
            //   // categoryId:
            //   //     cartState.allTypedFoods.fruitsAndVegetables.first.category,
            //   categoryId: "",
            //   items: cartState.allTypedFoods.fruitsAndVegetables,
            // ),
            // gap12,
            // PackageTile(
            //   title: "Grains",
            //   titleCalorie: calorie.totalGrains,
            //   // categoryId: cartState.allTypedFoods.grains.first.category,
            //   categoryId: "",
            //   items: cartState.allTypedFoods.grains,
            // ),
            // gap12,
            // PackageTile(
            //   title: "Proteins",
            //   titleCalorie: calorie.totalProteins,
            //   categoryId: "6466bfe8e62de0ed60e53934",
            //   items: cartState.allTypedFoods.protein,
            // ),

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
          onPressed: cartState.selectedFoodItems.isEmpty
              ? null
              : () {
                  context.push(OrderDetailsScreen.route);
                },
          child: Text(context.local.continueText),
        ),
      ),
    );
  }
}
