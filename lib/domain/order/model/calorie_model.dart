import 'package:equatable/equatable.dart';

class CalorieModel extends Equatable {
  final double totalCalorie;
  final double totalDairy;
  final double totalFruitsAndVegetables;
  final double totalGrains;
  final double totalProteins;
  const CalorieModel({
    required this.totalCalorie,
    required this.totalDairy,
    required this.totalFruitsAndVegetables,
    required this.totalGrains,
    required this.totalProteins,
  });

  CalorieModel copyWith({
    double? totalCalorie,
    double? totalDairy,
    double? totalFruitsAndVegetables,
    double? totalGrains,
    double? totalProteins,
  }) {
    return CalorieModel(
      totalCalorie: totalCalorie ?? this.totalCalorie,
      totalDairy: totalDairy ?? this.totalDairy,
      totalFruitsAndVegetables:
          totalFruitsAndVegetables ?? this.totalFruitsAndVegetables,
      totalGrains: totalGrains ?? this.totalGrains,
      totalProteins: totalProteins ?? this.totalProteins,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalCalorie': totalCalorie,
      'totalDairy': totalDairy,
      'totalFruitsAndVegetables': totalFruitsAndVegetables,
      'totalGrains': totalGrains,
      'totalProteins': totalProteins,
    };
  }

  factory CalorieModel.fromMap(Map<String, dynamic> map) {
    return CalorieModel(
      totalCalorie: map['totalCalorie']?.toDouble() ?? 0.0,
      totalDairy: map['totalDairy']?.toDouble() ?? 0.0,
      totalFruitsAndVegetables:
          map['totalFruitsAndVegetables']?.toDouble() ?? 0.0,
      totalGrains: map['totalGrains']?.toDouble() ?? 0.0,
      totalProteins: map['totalProteins']?.toDouble() ?? 0.0,
    );
  }

  @override
  String toString() {
    return 'CalorieModel(totalCalorie: $totalCalorie, totalDairy: $totalDairy, totalFruitsAndVegetables: $totalFruitsAndVegetables, totalGrains: $totalGrains, totalProteins: $totalProteins)';
  }

  @override
  List<Object> get props {
    return [
      totalCalorie,
      totalDairy,
      totalFruitsAndVegetables,
      totalGrains,
      totalProteins,
    ];
  }
}
