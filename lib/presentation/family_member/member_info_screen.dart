import 'dart:developer';

import 'package:be_gelled/application/family_member/family_member_provider.dart';
import 'package:be_gelled/domain/family_member/member_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../utils/utils.dart';
import '../widgets/widgets.dart';

enum DiseaseCondition { yes, no, notTestedYet }

enum Allergy { yes, no }

class MemberInfoScreen extends HookConsumerWidget {
  static const route = "/member_info";
  const MemberInfoScreen({super.key, required this.memberIndex});

  final int memberIndex;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(familyMemberProvider);
    final memberInfo = state.members[memberIndex];

    //:Text editing controllers
    final nameController = useTextEditingController(text: memberInfo.name);
    final banglaNameController =
        useTextEditingController(text: memberInfo.nameBengali);
    final phoneController = useTextEditingController(text: memberInfo.phone);
    final weightController =
        useTextEditingController(text: memberInfo.weight?.toString());
    final birthDate = useState<DateTime?>(null);
    final dobController =
        useTextEditingController(text: memberInfo.dateOfBirth);
    final otherController = useTextEditingController(
        text: memberInfo.othersProblem.isEmpty
            ? context.local.aA
            : memberInfo.othersProblem);

    //: Focus nodes
    final fullNameNode = useFocusNode();
    final banglaNameNode = useFocusNode();
    final phoneNode = useFocusNode();
    final dobNode = useFocusNode();
    final weightNode = useFocusNode();
    final otherNode = useFocusNode();

    //: Values

    final height = useState(memberInfo.height.toDouble());

    final gender = useState<Gender?>(null);
    final physical = useState<PhysicalActivity?>(null);

    final isDiabetic = useState<DiseaseCondition?>(
        memberInfo.diabeticPatient ? DiseaseCondition.yes : null);
    final diabetic = useState(memberInfo.diabeticLevel);

    final isKidney = useState<DiseaseCondition?>(
        memberInfo.kidneyPatient ? DiseaseCondition.yes : null);
    final kidney = useState(memberInfo.kidneyLevel);

    final isAllergy = useState<bool>(memberInfo.allergy);

    final otherTextFieldKey = useMemoized(GlobalKey.new);
    final weightTextFieldKey = useMemoized(GlobalKey.new);

    void getBack() {
      Navigator.pop(context);
    }

    void setInfo() async {
      FocusManager.instance.primaryFocus?.unfocus();
      final success =
          await ref.read(familyMemberProvider.notifier).saveMemberInfo(
                memberInfo.copyWith(
                  name: nameController.text,
                  nameBengali: banglaNameController.text,
                  phone: phoneController.text,
                  height: height.value,
                  weight: int.parse(weightController.text),
                  gender: gender.value,
                  physicalActivity: physical.value,
                  age: DateTime.now().year - birthDate.value!.year,
                  dateOfBirth: birthDate.value?.formatDivider(),
                  diabeticPatient: isDiabetic.value == DiseaseCondition.yes,
                  diabeticLevel: isDiabetic.value == DiseaseCondition.yes
                      ? diabetic.value
                      : null,
                  kidneyPatient: isKidney.value == DiseaseCondition.yes,
                  kidneyLevel: isKidney.value == DiseaseCondition.yes
                      ? kidney.value
                      : null,
                  allergy: isAllergy.value,
                  othersProblem: otherController.text == context.local.aA
                      ? ""
                      : otherController.text,
                ),
                memberIndex,
              );
      if (success) getBack();
    }

    useEffect(() {
      return () {};
    }, const []);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.h).copyWith(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            gap28,
            Text(
              'Member 0$memberIndex',
              style: CustomTextStyle.textStyle24w700,
            ),
            gap32,
            KContainer(
              child: Column(
                crossAxisAlignment: crossStart,
                children: [
                  Text(
                    "Personal Information",
                    style: CustomTextStyle.textStyle16w600HG1000,
                  ),
                  gap24,
                  KTextFormField2(
                    labelText: "Full Name",
                    controller: nameController,
                    focusNode: fullNameNode,
                  ),
                  gap24,
                  KTextFormField2(
                    labelText: "Name In Bangla",
                    controller: banglaNameController,
                    focusNode: banglaNameNode,
                  ),
                  gap24,
                  KTextFormField2(
                    labelText: "Phone",
                    controller: phoneController,
                    focusNode: phoneNode,
                    keyboardType: TextInputType.phone,
                  ),
                  gap24,
                  Text(
                    "Gender",
                    style: CustomTextStyle.textStyle16w500HG1000,
                  ),
                  Row(
                    children: [
                      ...List.generate(
                        Gender.values.length,
                        (index) => GenderRadioTile(
                          index: index,
                          gender: gender,
                          onChanged: (value) => gender.value = value,
                        ),
                      )
                    ],
                  ),
                  gap24,
                  KTextFormField2(
                    controller: dobController,
                    onTap: () {
                      log("TAPPED");
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      ).then((date) {
                        if (date != null) {
                          birthDate.value = date;
                          dobController.text =
                              DateFormat("dd MMM yyyy").format(date);
                        }
                      });
                    },
                    hintText: "Date of Birth",
                    focusNode: dobNode,
                    readOnly: true,
                    enabled: false,
                    contentPadding: EdgeInsets.only(
                      top: 20.h,
                      bottom: 20.h,
                      left: 2.w,
                      right: 16.w,
                    ),
                    // contentPadding: EdgeInsets.zero,
                    prefixIcon: Image.asset(
                      Images.iconCalendar,
                      width: 22.w,
                      height: 22.w,
                      color: const Color(0xff28303F),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  gap24,
                  Text(
                    "Height : ${(height.value * 0.0833333).toStringAsFixed(0)}ft : ${(height.value % 12).toStringAsFixed(0)}inch",
                    style: CustomTextStyle.textStyle16w500HG1000,
                  ),
                  gap16,
                  Slider(
                    value: height.value,
                    min: 0.0,
                    max: 96.0,
                    divisions: 96,
                    label: height.value.toStringAsFixed(1),
                    onChanged: (value) {
                      height.value = value;
                    },
                  ),
                  gap24,
                  KTextFormField2(
                    key: weightTextFieldKey,
                    labelText: "Weight (kg)",
                    controller: weightController,
                    focusNode: weightNode,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onTap: () => ensureVisibleOnTextArea(
                        textfieldKey: weightTextFieldKey),
                  ),
                  gap24,
                  Text(
                    "Physical Activity Level",
                    style: CustomTextStyle.textStyle16w500HG1000,
                  ),
                  Row(
                    children: [
                      ...List.generate(
                        PhysicalActivity.values.length,
                        (index) => PhysicalRadioTile(
                          index: index,
                          physical: physical,
                          onChanged: (value) => physical.value = value,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            gap16,
            KContainer(
              child: Column(
                crossAxisAlignment: crossStart,
                children: [
                  Text(
                    context.local.medicalInformation,
                    style: CustomTextStyle.textStyle16w600HG1000,
                  ),
                  gap24,
                  _diseasesItem(
                    title: context.local.diabeticPatient,
                    isDisease: isDiabetic,
                    disease: diabetic,
                  ),
                  gap24,
                  _diseasesItem(
                    title: context.local.kidneyPatient,
                    isDisease: isKidney,
                    disease: kidney,
                  ),
                  gap24,
                  Text(
                    context.local.allergy,
                    style: CustomTextStyle.textStyle16w500HG1000,
                  ),
                  Row(
                    mainAxisAlignment: mainSpaceAround,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: true,
                            groupValue: isAllergy.value,
                            onChanged: (value) {
                              isAllergy.value = value!;
                            },
                          ),
                          Text('yes'.toWordTitleCase()),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: false,
                            groupValue: isAllergy.value,
                            onChanged: (value) {
                              isAllergy.value = value!;
                            },
                          ),
                          Text("no".toWordTitleCase()),
                        ],
                      ),
                    ],
                  ),
                  gap16,
                  KTextFormField2(
                    key: otherTextFieldKey,
                    labelText: context.local.othersPhysicalProblem,
                    controller: otherController,
                    focusNode: otherNode,
                    maxLines: null,
                    onTap: () {
                      otherController.text == context.local.aA
                          ? otherController.clear()
                          : null;

                      ensureVisibleOnTextArea(textfieldKey: otherTextFieldKey);
                    },
                  ),
                ],
              ),
            ),
            gap18,
            KFilledButton(
              loading: state.loading,
              onPressed: () => setInfo(),
              text: context.local.save,
            ),
            gap32,
          ],
        ),
      ),
    );
  }

  Column _diseasesItem({
    required String title,
    required ValueNotifier<DiseaseCondition?> isDisease,
    required ValueNotifier<double> disease,
  }) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Text(
          title,
          style: CustomTextStyle.textStyle16w500HG1000,
        ),
        Row(
          children: [
            ...List.generate(
              DiseaseCondition.values.length,
              (index) => Row(
                children: [
                  Radio(
                    value: DiseaseCondition.values[index],
                    groupValue: isDisease.value,
                    onChanged: (value) {
                      isDisease.value = value;
                    },
                  ),
                  Text(DiseaseCondition.values[index].name
                      .toString()
                      .toWordTitleCase()),
                ],
              ),
            ),
          ],
        ),
        gap16,
        Slider(
          value: disease.value,
          min: 0.0,
          max: 30.0,
          divisions: 100,
          label: disease.value.toStringAsFixed(1),
          onChanged: isDisease.value == DiseaseCondition.yes
              ? (value) {
                  disease.value = value;
                }
              : null,
        ),
      ],
    );
  }
}

class GenderRadioTile extends HookConsumerWidget {
  const GenderRadioTile({
    super.key,
    required this.index,
    required this.gender,
    required this.onChanged,
  });

  final int index;
  final ValueNotifier<Gender?> gender;
  final void Function(Gender?)? onChanged;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Radio(
          value: Gender.values[index],
          groupValue: gender.value,
          onChanged: onChanged,
        ),
        Text(Gender.values[index].name.toString().toTitleCase()),
      ],
    );
  }
}

class PhysicalRadioTile extends HookConsumerWidget {
  const PhysicalRadioTile({
    super.key,
    required this.index,
    required this.physical,
    required this.onChanged,
  });

  final int index;
  final ValueNotifier<PhysicalActivity?> physical;
  final void Function(PhysicalActivity?)? onChanged;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Radio(
          value: PhysicalActivity.values[index],
          groupValue: physical.value,
          onChanged: onChanged,
        ),
        Text(PhysicalActivity.values[index].name.toString().toTitleCase()),
      ],
    );
  }
}
