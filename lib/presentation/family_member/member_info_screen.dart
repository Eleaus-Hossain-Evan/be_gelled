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
    final memberInfo = ref.watch(familyMemberProvider).members[memberIndex];

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
        text: memberInfo.otherPhysicalProblem.isEmpty
            ? context.local.aA
            : memberInfo.otherPhysicalProblem);

    //: Focus nodes
    final fullNameNode = useFocusNode();
    final banglaNameNode = useFocusNode();
    final phoneNode = useFocusNode();
    final dobNode = useFocusNode();
    final weightNode = useFocusNode();
    final otherNode = useFocusNode();

    //: Values

    final height = useState(memberInfo.height.toDouble());

    final isDiabetic = useState<DiseaseCondition?>(
        memberInfo.diabetic == 0 ? null : DiseaseCondition.yes);
    final diabetic = useState(memberInfo.diabetic);

    final isKidney = useState<DiseaseCondition?>(
        memberInfo.kidney == 0 ? null : DiseaseCondition.yes);
    final kidney = useState(memberInfo.kidney);

    final isAllergy =
        useState<Allergy?>(memberInfo.allergy ? Allergy.yes : null);

    final otherTextFieldKey = useMemoized(GlobalKey.new);
    final weightTextFieldKey = useMemoized(GlobalKey.new);

    void setInfo() {
      ref.read(familyMemberProvider.notifier).setMemberInfo(
            memberInfo.copyWith(
              name: nameController.text,
              nameBengali: banglaNameController.text,
              phone: phoneController.text,
              weight: int.parse(weightController.text),
              dateOfBirth: dobController.text,
              diabetic: isDiabetic.value == DiseaseCondition.yes
                  ? diabetic.value
                  : null,
              kidney:
                  isKidney.value == DiseaseCondition.yes ? kidney.value : null,
              allergy: isAllergy.value?.index == 0 ? true : false,
              otherPhysicalProblem: otherController.text == context.local.aA
                  ? ""
                  : otherController.text,
            ),
            memberIndex,
          );
      Navigator.pop(context);
    }

    useEffect(() {
      return () {};
    }, const []);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: .9.sh,
        child: SingleChildScrollView(
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
                        ...List.generate(Gender.values.length,
                            (index) => _genderRadioTile(index, ref))
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
                      "Height : ${(height.value / 12).toStringAsFixed(0)}ft : ${(height.value % 12).toStringAsFixed(0)}inch",
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
                        ...List.generate(PhysicalActivity.values.length,
                            (index) => _physicalRadioTile(index, ref))
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
                      children: [
                        ...List.generate(
                          Allergy.values.length,
                          (index) => Row(
                            children: [
                              Radio(
                                value: Allergy.values[index],
                                groupValue: isAllergy.value,
                                onChanged: (value) {
                                  isAllergy.value = value;
                                },
                              ),
                              Text(Allergy.values[index].name
                                  .toString()
                                  .toWordTitleCase()),
                            ],
                          ),
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

                        ensureVisibleOnTextArea(
                            textfieldKey: otherTextFieldKey);
                      },
                    ),
                  ],
                ),
              ),
              gap32,
              FilledButton(
                onPressed: () => setInfo(),
                child: Text(context.local.save),
              ),
            ],
          ),
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

  Row _genderRadioTile(int index, WidgetRef ref) {
    final member = ref.watch(familyMemberProvider).members[memberIndex];
    return Row(
      children: [
        Radio(
          value: Gender.values[index],
          groupValue: member.gender,
          onChanged: (value) {
            ref
                .read(familyMemberProvider.notifier)
                .setMemberInfo(member.copyWith(gender: value), memberIndex);
          },
        ),
        Text(Gender.values[index].name.toString().toTitleCase()),
      ],
    );
  }

  Row _physicalRadioTile(int index, WidgetRef ref) {
    final member = ref.watch(familyMemberProvider).members[memberIndex];
    return Row(
      children: [
        Radio(
          value: PhysicalActivity.values[index],
          groupValue: member.physicalActivity,
          onChanged: (value) {
            ref.read(familyMemberProvider.notifier).setMemberInfo(
                member.copyWith(physicalActivity: value), memberIndex);
          },
        ),
        Text(PhysicalActivity.values[index].name.toString().toTitleCase()),
      ],
    );
  }

  Row _activationRadioTile(int index, WidgetRef ref) {
    return Row(
      children: [
        Radio(
          value: DiseaseCondition.values[index],
          groupValue: DiseaseCondition,
          onChanged: (value) {},
        ),
        Text(DiseaseCondition.values[index].name.toString().toTitleCase()),
      ],
    );
  }
}
