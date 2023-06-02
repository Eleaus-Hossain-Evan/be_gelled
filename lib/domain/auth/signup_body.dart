import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignupBody extends Equatable {
  final String phone;

  const SignupBody({
    required this.phone,
  });

  SignupBody copyWith({
    String? phone,
  }) {
    return SignupBody(
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "firstName": "evan",
      "lastName": "hossain",
      "phone": phone,
      "email": "123@gmail.com",
      "language": "en",
      "usedReferralCode": ""
    };
  }

  factory SignupBody.fromMap(Map<String, dynamic> map) {
    return SignupBody(
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupBody.fromJson(String source) =>
      SignupBody.fromMap(json.decode(source));

  @override
  String toString() => 'SignupBody(phone: $phone)';

  @override
  List<Object> get props => [phone];
}
