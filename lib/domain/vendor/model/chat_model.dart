import 'dart:convert';

import 'package:equatable/equatable.dart';

class VendorChatModel extends Equatable {
  final String avater;
  final String name;
  final String message;
  final String time;

  const VendorChatModel({
    required this.avater,
    required this.name,
    required this.message,
    required this.time,
  });

  VendorChatModel copyWith({
    String? avater,
    String? name,
    String? message,
    String? time,
  }) {
    return VendorChatModel(
      avater: avater ?? this.avater,
      name: name ?? this.name,
      message: message ?? this.message,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'avater': avater,
      'name': name,
      'message': message,
      'time': time,
    };
  }

  factory VendorChatModel.fromMap(Map<String, dynamic> map) {
    return VendorChatModel(
      avater: map['avater'] ?? '',
      name: map['name'] ?? '',
      message: map['message'] ?? '',
      time: map['time'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VendorChatModel.fromJson(String source) =>
      VendorChatModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VendorChatModel(avater: $avater, name: $name, message: $message, time: $time)';
  }

  @override
  List<Object> get props => [avater, name, message, time];
}

final chatList = [
  VendorChatModel(
    avater: 'assets/avatar.png',
    name: 'Karim',
    message:
        'Lorem ipsum dolor sit amet consectetur. Vitae malesuada diam ut dictum. Placerat.',
    time: '55 min ago',
  ),
  VendorChatModel(
    avater: 'assets/avatar.png',
    name: 'Auto Fare Service and Parts',
    message:
        'Hi Karim, \nAmet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
    time: '55 min ago',
  ),
];
