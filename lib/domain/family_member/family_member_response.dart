import 'package:equatable/equatable.dart';

import 'member_info_model.dart';

class FamilyMembersResponse extends Equatable {
  final List<MemberInfoModel> data;
  final bool success;
  final String message;

  const FamilyMembersResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  FamilyMembersResponse copyWith({
    List<MemberInfoModel>? data,
    bool? success,
    String? message,
  }) {
    return FamilyMembersResponse(
      data: data ?? this.data,
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.map((x) => x.toMap()).toList(),
      'success': success,
      'message': message,
    };
  }

  factory FamilyMembersResponse.fromMap(Map<String, dynamic> map) {
    return FamilyMembersResponse(
      data: List<MemberInfoModel>.from(
          map['data']?.map((x) => MemberInfoModel.fromMap(x)) ?? const []),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  @override
  String toString() =>
      'FamilyMembersResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];
}
