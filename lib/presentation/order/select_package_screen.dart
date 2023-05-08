import 'package:be_gelled/presentation/order/package_model.dart';
import 'package:be_gelled/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/widgets.dart';
import 'widgets/package_customization.dart';
import 'widgets/package_tile.dart';

final packageList = [
  const PackageModel(
    name: "Package Name 1",
    items: [
      PackageItemModel(name: "Fish (Hilsha Fish)", amount: .8),
      PackageItemModel(name: "Red Spinach", amount: .2),
      PackageItemModel(name: "Sugar", amount: .5),
      PackageItemModel(name: "Chicken (Layer)", amount: 1),
    ],
  ),
  const PackageModel(
    name: "Package Name 2",
    items: [
      PackageItemModel(name: "Fish (Hilsha Fish)", amount: .8),
      PackageItemModel(name: "Red Spinach", amount: .2),
      PackageItemModel(name: "Sugar", amount: .5),
      PackageItemModel(name: "Chicken (Layer)", amount: 1),
    ],
  ),
  const PackageModel(
    name: "Package Name 3",
    items: [
      PackageItemModel(name: "Fish (Hilsha Fish)", amount: .8),
      PackageItemModel(name: "Red Spinach", amount: .2),
      PackageItemModel(name: "Sugar", amount: .5),
      PackageItemModel(name: "Chicken (Layer)", amount: 1),
    ],
  ),
  const PackageModel(
    name: "Package Name 4",
    items: [
      PackageItemModel(name: "Fish (Hilsha Fish)", amount: .8),
      PackageItemModel(name: "Red Spinach", amount: .2),
      PackageItemModel(name: "Sugar", amount: .5),
      PackageItemModel(name: "Chicken (Layer)", amount: 1),
    ],
  ),
];

class SelectPackageScreen extends HookConsumerWidget {
  static const String route = '/select-package';
  const SelectPackageScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            KListViewSeparated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separator: gap16,
              itemBuilder: (context, index) => PackageTile(
                model: packageList[index],
                onTap: () {
                  showCustomSheet(
                    context: context,
                    builder: (context) => PackageCustomization(
                      model: packageList[index],
                    ),
                  );
                },
              ),
              itemCount: packageList.length,
            )
          ],
        ),
      ),
    );
  }
}
