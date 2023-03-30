import 'dart:convert';

import 'package:equatable/equatable.dart';

class CarModel extends Equatable {
  final String title;
  final String subtitle;
  final String thumbnail;
  final double rating;
  final int totalSold;
  final double price;

  const CarModel({
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.totalSold,
    required this.price,
  });

  factory CarModel.init() => const CarModel(
        thumbnail: '',
        title: '',
        subtitle: '',
        rating: 0.0,
        totalSold: 0,
        price: 0.0,
      );

  CarModel copyWith({
    String? thumbnail,
    String? title,
    String? subtitle,
    double? rating,
    int? totalSold,
    double? price,
  }) {
    return CarModel(
      thumbnail: thumbnail ?? this.thumbnail,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      rating: rating ?? this.rating,
      totalSold: totalSold ?? this.totalSold,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'thumbnail': thumbnail,
      'title': title,
      'subtitle': subtitle,
      'rating': rating,
      'totalSold': totalSold,
      'price': price,
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      thumbnail: map['thumbnail'] ?? '',
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      totalSold: map['totalSold']?.toInt() ?? 0,
      price: map['price']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarModel.fromJson(String source) =>
      CarModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CarModel(thumbnail: $thumbnail, title: $title, subtitle: $subtitle, rating: $rating, totalSold: $totalSold, price: $price)';
  }

  @override
  List<Object> get props {
    return [
      thumbnail,
      title,
      subtitle,
      rating,
      totalSold,
      price,
    ];
  }
}

final carList = [
  const CarModel(
    thumbnail:
        'https://images.pexels.com/photos/2127733/pexels-photo-2127733.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Z Service Centre',
    subtitle: '2019',
    rating: 4.5,
    totalSold: 100,
    price: 100,
  ),
  const CarModel(
    thumbnail:
        'https://images.pexels.com/photos/919073/pexels-photo-919073.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Pure Service and parts ',
    subtitle: '2019',
    rating: 4.5,
    totalSold: 100,
    price: 150,
  ),
  const CarModel(
    thumbnail:
        'https://images.pexels.com/photos/1592384/pexels-photo-1592384.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Z Service Centre',
    subtitle: '2019',
    rating: 4.5,
    totalSold: 100,
    price: 120,
  ),
  const CarModel(
    thumbnail:
        'https://images.pexels.com/photos/1164778/pexels-photo-1164778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Toyota Camry',
    subtitle: '2019',
    rating: 4.5,
    totalSold: 100,
    price: 180,
  ),
  const CarModel(
    thumbnail:
        'https://images.pexels.com/photos/1164778/pexels-photo-1164778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Toyota Camry',
    subtitle: '2019',
    rating: 4.5,
    totalSold: 100,
    price: 110,
  ),
  const CarModel(
    thumbnail:
        'https://images.pexels.com/photos/1164778/pexels-photo-1164778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Toyota Camry',
    subtitle: '2019',
    rating: 4.5,
    totalSold: 100,
    price: 130,
  ),
  const CarModel(
    thumbnail:
        'https://images.pexels.com/photos/1164778/pexels-photo-1164778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Toyota Camry',
    subtitle: '2019',
    rating: 4.5,
    totalSold: 100,
    price: 105,
  ),
  const CarModel(
    thumbnail:
        'https://images.pexels.com/photos/1545743/pexels-photo-1545743.jpeg?auto=compress&cs=tinysrgb&w=600',
    title: 'Toyota Camry',
    subtitle: '2019',
    rating: 4.5,
    totalSold: 100,
    price: 102,
  ),
];
