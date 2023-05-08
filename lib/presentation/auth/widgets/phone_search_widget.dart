import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';

showPhoneSelectingSheet({
  required BuildContext context,
  required List<PhoneDirectory> directory,
  required Function(PhoneDirectory) directorySelector,
}) =>
    showCustomSheet(
      context: context,
      builder: (context) {
        return PhoneSearchWidget(
          directory: directory,
          directorySelector: directorySelector,
        );
      },
    );

class PhoneSearchWidget extends HookConsumerWidget {
  const PhoneSearchWidget({
    super.key,
    required this.directory,
    required this.directorySelector,
  });

  final List<PhoneDirectory> directory;
  final Function(PhoneDirectory) directorySelector;

  @override
  Widget build(BuildContext context, ref) {
    final searchController = useTextEditingController();
    final searchDirectory = useState<List<PhoneDirectory>>(directory);
    useEffect(() {
      searchController.addListener(() {
        searchDirectory.value = directory
            .where((element) => element.name
                .toLowerCase()
                .startsWith(searchController.text.toLowerCase()))
            .toList();
      });
    }, const []);
    return SizedBox(
      height: .6.sh,
      child: Column(
        children: [
          TextFormField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: context.local.search,
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchDirectory.value.length,
              itemBuilder: (context, index) {
                final item = searchDirectory.value[index];
                return ListTile(
                  onTap: () {
                    directorySelector(item);
                    Navigator.pop(context);
                  },
                  leading: Text(item.flag),
                  title: Text(item.name),
                  subtitle: Text(item.dialCode),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
