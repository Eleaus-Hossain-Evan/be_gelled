import 'package:equatable/equatable.dart';

import 'model/food_item_mode.dart';

class AllProductsResponse extends Equatable {
  final List<FoodItemModel> fruitsAndVegetables;
  final List<FoodItemModel> grains;
  final List<FoodItemModel> protein;
  final List<FoodItemModel> dairy;
  final List<FoodItemModel> beverages;
  final List<FoodItemModel> oil;

  const AllProductsResponse({
    required this.fruitsAndVegetables,
    required this.grains,
    required this.protein,
    required this.dairy,
    required this.beverages,
    required this.oil,
  });

  factory AllProductsResponse.init() {
    return const AllProductsResponse(
      fruitsAndVegetables: [],
      grains: [],
      protein: [],
      dairy: [],
      beverages: [],
      oil: [],
    );
  }

  AllProductsResponse copyWith({
    List<FoodItemModel>? fruitsAndVegetables,
    List<FoodItemModel>? grains,
    List<FoodItemModel>? protein,
    List<FoodItemModel>? dairy,
    List<FoodItemModel>? beverages,
    List<FoodItemModel>? oil,
  }) {
    return AllProductsResponse(
      fruitsAndVegetables: fruitsAndVegetables ?? this.fruitsAndVegetables,
      grains: grains ?? this.grains,
      protein: protein ?? this.protein,
      dairy: dairy ?? this.dairy,
      beverages: beverages ?? this.beverages,
      oil: oil ?? this.oil,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fruitsAndVegetables': fruitsAndVegetables.map((x) => x.toMap()).toList(),
      'grains': grains.map((x) => x.toMap()).toList(),
      'protein': protein.map((x) => x.toMap()).toList(),
      'dairy': dairy.map((x) => x.toMap()).toList(),
      'beverages': beverages.map((x) => x.toMap()).toList(),
      'oil': oil.map((x) => x.toMap()).toList(),
    };
  }

  factory AllProductsResponse.fromMap(Map<String, dynamic> map) {
    return AllProductsResponse(
      fruitsAndVegetables: List<FoodItemModel>.from(
          map['fruitsAndVegetables']?.map((x) => FoodItemModel.fromMap(x)) ??
              const []),
      grains: List<FoodItemModel>.from(
          map['grains']?.map((x) => FoodItemModel.fromMap(x)) ?? const []),
      protein: List<FoodItemModel>.from(
          map['protein']?.map((x) => FoodItemModel.fromMap(x)) ?? const []),
      dairy: List<FoodItemModel>.from(
          map['dairy']?.map((x) => FoodItemModel.fromMap(x)) ?? const []),
      beverages: List<FoodItemModel>.from(
          map['beverages']?.map((x) => FoodItemModel.fromMap(x)) ?? const []),
      oil: List<FoodItemModel>.from(
          map['oil']?.map((x) => FoodItemModel.fromMap(x)) ?? const []),
    );
  }

  @override
  String toString() {
    return 'AllProductsResponse(fruitsAndVegetables: $fruitsAndVegetables, grains: $grains, protein: $protein, dairy: $dairy, beverages: $beverages, oil: $oil)';
  }

  @override
  List<Object> get props {
    return [
      fruitsAndVegetables,
      grains,
      protein,
      dairy,
      beverages,
      oil,
    ];
  }
}

final all_products = AllProductsResponse.fromMap({
  "fruitsAndVegetables": [
    {
      "_id": "64677d711315b64a5328b0a7",
      "name": "Pumpkin",
      "nameInBengali": "কুমড়া",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 26,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:21.386Z",
      "updatedAt": "2023-05-19T13:45:21.386Z",
      "__v": 0
    },
    {
      "_id": "64677d711315b64a5328b0ab",
      "name": "Green Banana",
      "nameInBengali": "কাচকলা",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 116,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:21.395Z",
      "updatedAt": "2023-05-19T13:45:21.395Z",
      "__v": 0
    },
    {
      "_id": "64677d721315b64a5328b0b7",
      "name": "Potato",
      "nameInBengali": "আলু",
      "image": "",
      "typeByNutrients": ["Carbohydrates"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 77,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:22.244Z",
      "updatedAt": "2023-05-19T13:45:22.244Z",
      "__v": 0
    },
    {
      "_id": "64677d721315b64a5328b0b5",
      "name": "Carrot",
      "nameInBengali": "গাজর",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 41,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:22.241Z",
      "updatedAt": "2023-05-19T13:45:22.241Z",
      "__v": 0
    },
    {
      "_id": "64677d721315b64a5328b0b3",
      "name": "Onion",
      "nameInBengali": "পেঁয়াজ",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 40,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:22.236Z",
      "updatedAt": "2023-05-19T13:45:22.236Z",
      "__v": 0
    },
    {
      "_id": "64677d721315b64a5328b0bd",
      "name": "Spinach",
      "nameInBengali": "পালং শাক",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 23,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:22.254Z",
      "updatedAt": "2023-05-19T13:45:22.254Z",
      "__v": 0
    },
    {
      "_id": "64677d721315b64a5328b0bb",
      "name": "Cabbage",
      "nameInBengali": "বাঁধাকপি",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 25,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:22.252Z",
      "updatedAt": "2023-05-19T13:45:22.252Z",
      "__v": 0
    },
    {
      "_id": "64677d721315b64a5328b0bf",
      "name": "Cauliflower",
      "nameInBengali": "ফুলকপি",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 25,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:22.258Z",
      "updatedAt": "2023-05-19T13:45:22.258Z",
      "__v": 0
    },
    {
      "_id": "64677d731315b64a5328b0c1",
      "name": "Cilantro",
      "nameInBengali": "ধনিয়া পাতা",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 23,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:23.084Z",
      "updatedAt": "2023-05-19T13:45:23.084Z",
      "__v": 0
    },
    {
      "_id": "64677d721315b64a5328b0b9",
      "name": "Bitter gourd",
      "nameInBengali": "উচ্ছে",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 17,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:22.250Z",
      "updatedAt": "2023-05-19T13:45:22.250Z",
      "__v": 0
    },
    {
      "_id": "64677d731315b64a5328b0c3",
      "name": "Green Papaya",
      "nameInBengali": "পাঁচকলা",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 43,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:23.088Z",
      "updatedAt": "2023-05-19T13:45:23.088Z",
      "__v": 0
    },
    {
      "_id": "64677d731315b64a5328b0c5",
      "name": "Capsicum",
      "nameInBengali": "শিমলা মরিচ",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 40,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:23.094Z",
      "updatedAt": "2023-05-19T13:45:23.094Z",
      "__v": 0
    },
    {
      "_id": "64677d731315b64a5328b0c9",
      "name": "Ginger",
      "nameInBengali": "আদা",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 80,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:23.099Z",
      "updatedAt": "2023-05-19T13:45:23.099Z",
      "__v": 0
    },
    {
      "_id": "64677d731315b64a5328b0c7",
      "name": "Garlic",
      "nameInBengali": "রসুন",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 149,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:23.096Z",
      "updatedAt": "2023-05-19T13:45:23.096Z",
      "__v": 0
    },
    {
      "_id": "64677d731315b64a5328b0cb",
      "name": "Cucumber",
      "nameInBengali": "শসা",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "WaterAndDrinks"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 15,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:23.101Z",
      "updatedAt": "2023-05-19T13:45:23.101Z",
      "__v": 0
    },
    {
      "_id": "64677d731315b64a5328b0d9",
      "name": "Papaya",
      "nameInBengali": "পেঁপে",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 43,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:23.946Z",
      "updatedAt": "2023-05-19T13:45:23.946Z",
      "__v": 0
    },
    {
      "_id": "64677d731315b64a5328b0cf",
      "name": "Tomato",
      "nameInBengali": "টমেটো",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 18,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:23.106Z",
      "updatedAt": "2023-05-19T13:45:23.106Z",
      "__v": 0
    },
    {
      "_id": "64677d731315b64a5328b0cd",
      "name": "Green chili",
      "nameInBengali": "কাঁচা মরিচ",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 40,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:23.104Z",
      "updatedAt": "2023-05-19T13:45:23.104Z",
      "__v": 0
    },
    {
      "_id": "64677d731315b64a5328b0d1",
      "name": "Pomegranate",
      "nameInBengali": "ডালিম",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 83,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:23.932Z",
      "updatedAt": "2023-05-19T13:45:23.932Z",
      "__v": 0
    },
    {
      "_id": "64677d731315b64a5328b0d3",
      "name": "Pineapple",
      "nameInBengali": "আনারস",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 50,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:23.939Z",
      "updatedAt": "2023-05-19T13:45:23.939Z",
      "__v": 0
    },
    {
      "_id": "64677d731315b64a5328b0d7",
      "name": "Coconut",
      "nameInBengali": "নারিকেল",
      "image": "",
      "typeByNutrients": ["Fat", "VitaminsAndMinerals", "WaterAndDrinks"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 354,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:23.943Z",
      "updatedAt": "2023-05-19T13:45:23.943Z",
      "__v": 0
    },
    {
      "_id": "64677d731315b64a5328b0d5",
      "name": "Mango",
      "nameInBengali": "আম",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 60,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:23.942Z",
      "updatedAt": "2023-05-19T13:45:23.942Z",
      "__v": 0
    },
    {
      "_id": "64677d741315b64a5328b0e3",
      "name": "Orange",
      "nameInBengali": "কমলা",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 43,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:24.762Z",
      "updatedAt": "2023-05-19T13:45:24.762Z",
      "__v": 0
    },
    {
      "_id": "64677d741315b64a5328b0e7",
      "name": "Lime",
      "nameInBengali": "কাগজলেবু",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 30,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:24.771Z",
      "updatedAt": "2023-05-19T13:45:24.771Z",
      "__v": 0
    },
    {
      "_id": "64677d731315b64a5328b0db",
      "name": "Banana",
      "nameInBengali": "কলা",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 96,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:23.948Z",
      "updatedAt": "2023-05-19T13:45:23.948Z",
      "__v": 0
    },
    {
      "_id": "64677d751315b64a5328b0f9",
      "name": "Apricot",
      "nameInBengali": "খোবানি",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 48,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:25.600Z",
      "updatedAt": "2023-05-19T13:45:25.600Z",
      "__v": 0
    },
    {
      "_id": "64677d731315b64a5328b0e1",
      "name": "Jackfruit",
      "nameInBengali": "কাঁঠাল",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 95,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:23.956Z",
      "updatedAt": "2023-05-19T13:45:23.956Z",
      "__v": 0
    },
    {
      "_id": "64677d731315b64a5328b0dd",
      "name": "Guava",
      "nameInBengali": "পেয়ারা",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 68,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:23.951Z",
      "updatedAt": "2023-05-19T13:45:23.951Z",
      "__v": 0
    },
    {
      "_id": "64677d731315b64a5328b0df",
      "name": "Watermelon",
      "nameInBengali": "তরমুজ",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "WaterAndDrinks"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 30,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:23.953Z",
      "updatedAt": "2023-05-19T13:45:23.953Z",
      "__v": 0
    },
    {
      "_id": "64677d741315b64a5328b0e9",
      "name": "Lemon",
      "nameInBengali": "লেবু",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 29,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:24.774Z",
      "updatedAt": "2023-05-19T13:45:24.774Z",
      "__v": 0
    },
    {
      "_id": "64677d741315b64a5328b0e5",
      "name": "Peach",
      "nameInBengali": "পিয়ারা",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 39,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:24.767Z",
      "updatedAt": "2023-05-19T13:45:24.767Z",
      "__v": 0
    },
    {
      "_id": "64677d751315b64a5328b0fb",
      "name": "Raspberry",
      "nameInBengali": "রাসভেরি",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 53,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:25.603Z",
      "updatedAt": "2023-05-19T13:45:25.603Z",
      "__v": 0
    },
    {
      "_id": "64677d751315b64a5328b0fd",
      "name": "Jhinga",
      "nameInBengali": "ঝিঙ্গা",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 19,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:25.606Z",
      "updatedAt": "2023-05-19T13:45:25.606Z",
      "__v": 0
    },
    {
      "_id": "64677d741315b64a5328b0eb",
      "name": "Mango (green)",
      "nameInBengali": "কাঁচা আম",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 60,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:24.776Z",
      "updatedAt": "2023-05-19T13:45:24.776Z",
      "__v": 0
    },
    {
      "_id": "64677d751315b64a5328b0ff",
      "name": "Pumpkin",
      "nameInBengali": "কুমড়া",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 26,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:25.608Z",
      "updatedAt": "2023-05-19T13:45:25.608Z",
      "__v": 0
    },
    {
      "_id": "64677d751315b64a5328b101",
      "name": "Passion fruit",
      "nameInBengali": "জাফলি",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 97,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:25.612Z",
      "updatedAt": "2023-05-19T13:45:25.612Z",
      "__v": 0
    },
    {
      "_id": "64677d741315b64a5328b0f3",
      "name": "Lychee",
      "nameInBengali": "লিচু",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 66,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:24.788Z",
      "updatedAt": "2023-05-19T13:45:24.788Z",
      "__v": 0
    },
    {
      "_id": "64677d741315b64a5328b0ef",
      "name": "Plum",
      "nameInBengali": "বরই",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 46,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:24.780Z",
      "updatedAt": "2023-05-19T13:45:24.780Z",
      "__v": 0
    },
    {
      "_id": "64677d741315b64a5328b0ed",
      "name": "Blackberry",
      "nameInBengali": "জাম",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 43,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:24.778Z",
      "updatedAt": "2023-05-19T13:45:24.778Z",
      "__v": 0
    },
    {
      "_id": "64677d751315b64a5328b103",
      "name": "Avocado",
      "nameInBengali": "আভকাডো",
      "image": "",
      "typeByNutrients": [
        "Fat",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 160,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:25.615Z",
      "updatedAt": "2023-05-19T13:45:25.615Z",
      "__v": 0
    },
    {
      "_id": "64677d741315b64a5328b0f1",
      "name": "Grapes",
      "nameInBengali": "আঙ্গুর",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 69,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:24.783Z",
      "updatedAt": "2023-05-19T13:45:24.783Z",
      "__v": 0
    },
    {
      "_id": "64677d751315b64a5328b105",
      "name": "Fig",
      "nameInBengali": "দুধগোয়ারা",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 74,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:25.617Z",
      "updatedAt": "2023-05-19T13:45:25.617Z",
      "__v": 0
    },
    {
      "_id": "64677d741315b64a5328b0f5",
      "name": "Pear",
      "nameInBengali": "নাসপাতি",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 57,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:24.791Z",
      "updatedAt": "2023-05-19T13:45:24.791Z",
      "__v": 0
    },
    {
      "_id": "64677d751315b64a5328b0f7",
      "name": "Dragonfruit",
      "nameInBengali": "ড্রাগনফ্রুট",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 60,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:25.594Z",
      "updatedAt": "2023-05-19T13:45:25.594Z",
      "__v": 0
    },
    {
      "_id": "64677d751315b64a5328b107",
      "name": "Custard Apple",
      "nameInBengali": "আতা",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 101,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:25.619Z",
      "updatedAt": "2023-05-19T13:45:25.619Z",
      "__v": 0
    },
    {
      "_id": "64677d751315b64a5328b109",
      "name": "Kumro",
      "nameInBengali": "কুমড়ো",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 19,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:25.622Z",
      "updatedAt": "2023-05-19T13:45:25.622Z",
      "__v": 0
    },
    {
      "_id": "64677d761315b64a5328b113",
      "name": "Kalmi Shak",
      "nameInBengali": "কালমি শাক",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 33,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:26.468Z",
      "updatedAt": "2023-05-19T13:45:26.468Z",
      "__v": 0
    },
    {
      "_id": "64677d761315b64a5328b119",
      "name": "Neem Pata",
      "nameInBengali": "নিম পাতা",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 136,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:26.476Z",
      "updatedAt": "2023-05-19T13:45:26.476Z",
      "__v": 0
    },
    {
      "_id": "64677d761315b64a5328b10f",
      "name": "Lal Shak",
      "nameInBengali": "লাল শাক",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 20,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:26.462Z",
      "updatedAt": "2023-05-19T13:45:26.462Z",
      "__v": 0
    },
    {
      "_id": "64677d761315b64a5328b11d",
      "name": "Potol",
      "nameInBengali": "পটল",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 19,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:26.481Z",
      "updatedAt": "2023-05-19T13:45:26.481Z",
      "__v": 0
    },
    {
      "_id": "64677d761315b64a5328b10d",
      "name": "Shorshe Shak",
      "nameInBengali": "সরিষা শাক",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 30,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:26.457Z",
      "updatedAt": "2023-05-19T13:45:26.457Z",
      "__v": 0
    },
    {
      "_id": "64677d761315b64a5328b11f",
      "name": "Kochur Mukhi",
      "nameInBengali": "কচুর মুখী",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 37,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:26.485Z",
      "updatedAt": "2023-05-19T13:45:26.485Z",
      "__v": 0
    },
    {
      "_id": "64677d751315b64a5328b10b",
      "name": "Sarson Saag",
      "nameInBengali": "সরিষা শাক",
      "image": "",
      "typeByNutrients": ["Protein", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 23,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:25.625Z",
      "updatedAt": "2023-05-19T13:45:25.625Z",
      "__v": 0
    },
    {
      "_id": "64677d761315b64a5328b123",
      "name": "Kalmi Shak",
      "nameInBengali": "কালমি শাক",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 33,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:26.488Z",
      "updatedAt": "2023-05-19T13:45:26.488Z",
      "__v": 0
    },
    {
      "_id": "64677d761315b64a5328b111",
      "name": "Notey Shak",
      "nameInBengali": "নটে শাক",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 57,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:26.466Z",
      "updatedAt": "2023-05-19T13:45:26.466Z",
      "__v": 0
    },
    {
      "_id": "64677d771315b64a5328b133",
      "name": "Dhonia Pata",
      "nameInBengali": "ধনিয়া পাতা",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 23,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:27.351Z",
      "updatedAt": "2023-05-19T13:45:27.351Z",
      "__v": 0
    },
    {
      "_id": "64677d761315b64a5328b117",
      "name": "Kochur Shak",
      "nameInBengali": "কচুর শাক",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 53,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:26.474Z",
      "updatedAt": "2023-05-19T13:45:26.474Z",
      "__v": 0
    },
    {
      "_id": "64677d761315b64a5328b115",
      "name": "Palong Shak",
      "nameInBengali": "পালং শাক",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 19,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:26.472Z",
      "updatedAt": "2023-05-19T13:45:26.472Z",
      "__v": 0
    },
    {
      "_id": "64677d771315b64a5328b12b",
      "name": "Chichinga",
      "nameInBengali": "চিচিঙ্গা",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 19,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:27.340Z",
      "updatedAt": "2023-05-19T13:45:27.340Z",
      "__v": 0
    },
    {
      "_id": "64677d761315b64a5328b11b",
      "name": "Lau",
      "nameInBengali": "লাউ",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 17,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:26.478Z",
      "updatedAt": "2023-05-19T13:45:26.478Z",
      "__v": 0
    },
    {
      "_id": "64677d771315b64a5328b12d",
      "name": "Lal Shak",
      "nameInBengali": "লাল শাক",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 20,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:27.342Z",
      "updatedAt": "2023-05-19T13:45:27.342Z",
      "__v": 0
    },
    {
      "_id": "64677d761315b64a5328b121",
      "name": "Kochu",
      "nameInBengali": "কচু",
      "image": "",
      "typeByNutrients": ["Carbohydrates", "Fiber", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 76,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:26.487Z",
      "updatedAt": "2023-05-19T13:45:26.487Z",
      "__v": 0
    },
    {
      "_id": "64677d771315b64a5328b135",
      "name": "Methi Shak",
      "nameInBengali": "মেথি শাক",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 49,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:27.353Z",
      "updatedAt": "2023-05-19T13:45:27.353Z",
      "__v": 0
    },
    {
      "_id": "64677d781315b64a5328b14b",
      "name": "Orange",
      "nameInBengali": "কমলা",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 43,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:28.185Z",
      "updatedAt": "2023-05-19T13:45:28.185Z",
      "__v": 0
    },
    {
      "_id": "64677d771315b64a5328b13d",
      "name": "Shaak",
      "nameInBengali": "শাক",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 30,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:27.364Z",
      "updatedAt": "2023-05-19T13:45:27.364Z",
      "__v": 0
    },
    {
      "_id": "64677d781315b64a5328b141",
      "name": "Apple",
      "nameInBengali": "আপেল",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 52,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:28.173Z",
      "updatedAt": "2023-05-19T13:45:28.173Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b15d",
      "name": "Cauliflower",
      "nameInBengali": "ফুলকপি",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 25,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.061Z",
      "updatedAt": "2023-05-19T13:45:29.061Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b15b",
      "name": "Cabbage",
      "nameInBengali": "বাঁধাকপি",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 25,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.057Z",
      "updatedAt": "2023-05-19T13:45:29.057Z",
      "__v": 0
    },
    {
      "_id": "64677d781315b64a5328b147",
      "name": "Pineapple",
      "nameInBengali": "আনারস",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 50,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:28.181Z",
      "updatedAt": "2023-05-19T13:45:28.181Z",
      "__v": 0
    },
    {
      "_id": "64677d781315b64a5328b145",
      "name": "Watermelon",
      "nameInBengali": "তরমুজ",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 30,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:28.178Z",
      "updatedAt": "2023-05-19T13:45:28.178Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b161",
      "name": "Tomato",
      "nameInBengali": "টমেটো",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 18,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.067Z",
      "updatedAt": "2023-05-19T13:45:29.067Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b15f",
      "name": "Radish",
      "nameInBengali": "মুল্লা",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 16,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.064Z",
      "updatedAt": "2023-05-19T13:45:29.064Z",
      "__v": 0
    },
    {
      "_id": "64677d781315b64a5328b159",
      "name": "Banana",
      "nameInBengali": "কলা",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 96,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:28.209Z",
      "updatedAt": "2023-05-19T13:45:28.209Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b163",
      "name": "Carrot",
      "nameInBengali": "গাজর",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 41,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.069Z",
      "updatedAt": "2023-05-19T13:45:29.069Z",
      "__v": 0
    },
    {
      "_id": "64677d781315b64a5328b157",
      "name": "Mango",
      "nameInBengali": "আম",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 60,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:28.205Z",
      "updatedAt": "2023-05-19T13:45:28.205Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b167",
      "name": "Guava",
      "nameInBengali": "পেয়ারা",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 68,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.072Z",
      "updatedAt": "2023-05-19T13:45:29.072Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b16b",
      "name": "Pomegranate",
      "nameInBengali": "ডালিম",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 83,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.079Z",
      "updatedAt": "2023-05-19T13:45:29.079Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b16d",
      "name": "Papaya",
      "nameInBengali": "পেঁপে",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 43,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.080Z",
      "updatedAt": "2023-05-19T13:45:29.080Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b173",
      "name": "Lemon",
      "nameInBengali": "লেবু",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 29,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.086Z",
      "updatedAt": "2023-05-19T13:45:29.086Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b165",
      "name": "Eggplant",
      "nameInBengali": "বেগুন",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 25,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.070Z",
      "updatedAt": "2023-05-19T13:45:29.070Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b169",
      "name": "Grapes",
      "nameInBengali": "আঙ্গুর",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 69,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.075Z",
      "updatedAt": "2023-05-19T13:45:29.075Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b16f",
      "name": "Coconut",
      "nameInBengali": "নারিকেল",
      "image": "",
      "typeByNutrients": ["Fiber", "VitaminsAndMinerals", "WaterAndDrinks"],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 354,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.081Z",
      "updatedAt": "2023-05-19T13:45:29.081Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b171",
      "name": "Strawberry",
      "nameInBengali": "স্ট্রবেরি",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53932",
      "caloriesPerHundredGram": 32,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.083Z",
      "updatedAt": "2023-05-19T13:45:29.083Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b175",
      "name": "Spinach",
      "nameInBengali": "পালং শাক",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 23,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.091Z",
      "updatedAt": "2023-05-19T13:45:29.091Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b195",
      "name": "Sweet Potato",
      "nameInBengali": "শাকপলা",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 86,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.980Z",
      "updatedAt": "2023-05-19T13:45:29.980Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b177",
      "name": "Cucumber",
      "nameInBengali": "শসা",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 16,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.092Z",
      "updatedAt": "2023-05-19T13:45:29.092Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b17b",
      "name": "Capsicum",
      "nameInBengali": "শিম",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 40,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.927Z",
      "updatedAt": "2023-05-19T13:45:29.927Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b18f",
      "name": "Pumpkin",
      "nameInBengali": "কুমড়া",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 26,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.966Z",
      "updatedAt": "2023-05-19T13:45:29.966Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b187",
      "name": "Garlic",
      "nameInBengali": "রসুন",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 149,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.950Z",
      "updatedAt": "2023-05-19T13:45:29.950Z",
      "__v": 0
    },
    {
      "_id": "64677d7b1315b64a5328b1b1",
      "name": "Bitter gourd",
      "nameInBengali": "উচ্ছে",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 19,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:31.660Z",
      "updatedAt": "2023-05-19T13:45:31.660Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b18b",
      "name": "Bell Pepper",
      "nameInBengali": "কাঁচা মরিচ",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 20,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.959Z",
      "updatedAt": "2023-05-19T13:45:29.959Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b191",
      "name": "Green Chili",
      "nameInBengali": "খোসা মরিচ",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 40,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.970Z",
      "updatedAt": "2023-05-19T13:45:29.970Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b189",
      "name": "Potato",
      "nameInBengali": "আলু",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 77,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.955Z",
      "updatedAt": "2023-05-19T13:45:29.955Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b185",
      "name": "Onion",
      "nameInBengali": "পেঁয়াজ",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 40,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.947Z",
      "updatedAt": "2023-05-19T13:45:29.947Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b18d",
      "name": "Ginger",
      "nameInBengali": "আদা",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 80,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.961Z",
      "updatedAt": "2023-05-19T13:45:29.961Z",
      "__v": 0
    },
    {
      "_id": "64677d7c1315b64a5328b1c5",
      "name": "Snake gourd",
      "nameInBengali": "চিচিঙ্গা",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 17,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:32.517Z",
      "updatedAt": "2023-05-19T13:45:32.517Z",
      "__v": 0
    },
    {
      "_id": "64677d7c1315b64a5328b1cd",
      "name": "Red amaranth",
      "nameInBengali": "লাল শাক",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 23,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:32.527Z",
      "updatedAt": "2023-05-19T13:45:32.527Z",
      "__v": 0
    },
    {
      "_id": "64677d7c1315b64a5328b1d9",
      "name": "Onion",
      "nameInBengali": "পেঁয়াজ",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 40,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:32.541Z",
      "updatedAt": "2023-05-19T13:45:32.541Z",
      "__v": 0
    },
    {
      "_id": "64677d7b1315b64a5328b1bb",
      "name": "Cauliflower",
      "nameInBengali": "ফুলকপি",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 25,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:31.675Z",
      "updatedAt": "2023-05-19T13:45:31.675Z",
      "__v": 0
    },
    {
      "_id": "64677d7b1315b64a5328b1b9",
      "name": "Spinach",
      "nameInBengali": "শাক",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 23,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:31.673Z",
      "updatedAt": "2023-05-19T13:45:31.673Z",
      "__v": 0
    },
    {
      "_id": "64677d7d1315b64a5328b1e5",
      "name": "Ridge gourd",
      "nameInBengali": "ঝিঙ্গা",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 20,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:33.390Z",
      "updatedAt": "2023-05-19T13:45:33.390Z",
      "__v": 0
    },
    {
      "_id": "64677d7c1315b64a5328b1e1",
      "name": "Green chili",
      "nameInBengali": "কাঁচা মরিচ",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 40,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:32.553Z",
      "updatedAt": "2023-05-19T13:45:32.553Z",
      "__v": 0
    },
    {
      "_id": "64677d7c1315b64a5328b1bd",
      "name": "Coriander leaves",
      "nameInBengali": "ধনিয়া পাতা",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 23,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:32.504Z",
      "updatedAt": "2023-05-19T13:45:32.504Z",
      "__v": 0
    },
    {
      "_id": "64677d7c1315b64a5328b1db",
      "name": "Carrot",
      "nameInBengali": "গাজর",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 41,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:32.543Z",
      "updatedAt": "2023-05-19T13:45:32.543Z",
      "__v": 0
    },
    {
      "_id": "64677d7d1315b64a5328b1e3",
      "name": "Beetroot",
      "nameInBengali": "বীট",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 43,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:33.386Z",
      "updatedAt": "2023-05-19T13:45:33.386Z",
      "__v": 0
    },
    {
      "_id": "64677d7c1315b64a5328b1bf",
      "name": "Ladies finger",
      "nameInBengali": "ঢ়েঁকি",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 33,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:32.509Z",
      "updatedAt": "2023-05-19T13:45:32.509Z",
      "__v": 0
    },
    {
      "_id": "64677d7c1315b64a5328b1c1",
      "name": "Culantro",
      "nameInBengali": "ধনে পাতা",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 23,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:32.512Z",
      "updatedAt": "2023-05-19T13:45:32.512Z",
      "__v": 0
    },
    {
      "_id": "64677d7d1315b64a5328b1e9",
      "name": "Pointed gourd",
      "nameInBengali": "পটল",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 20,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:33.395Z",
      "updatedAt": "2023-05-19T13:45:33.395Z",
      "__v": 0
    },
    {
      "_id": "64677d7d1315b64a5328b1e7",
      "name": "Sweet potato",
      "nameInBengali": "মিষ্টি আলু",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 86,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:33.392Z",
      "updatedAt": "2023-05-19T13:45:33.392Z",
      "__v": 0
    },
    {
      "_id": "64677d7d1315b64a5328b1eb",
      "name": "Bottle gourd",
      "nameInBengali": "লাউ",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 15,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:33.401Z",
      "updatedAt": "2023-05-19T13:45:33.401Z",
      "__v": 0
    },
    {
      "_id": "64677d7c1315b64a5328b1c3",
      "name": "Cucumber",
      "nameInBengali": "শসা",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 12,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:32.514Z",
      "updatedAt": "2023-05-19T13:45:32.514Z",
      "__v": 0
    },
    {
      "_id": "64677d7c1315b64a5328b1c9",
      "name": "Drumstick",
      "nameInBengali": "শজন",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 37,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:32.521Z",
      "updatedAt": "2023-05-19T13:45:32.521Z",
      "__v": 0
    },
    {
      "_id": "64677d7c1315b64a5328b1c7",
      "name": "Ceylon spinach",
      "nameInBengali": "পুই শাক",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 29,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:32.519Z",
      "updatedAt": "2023-05-19T13:45:32.519Z",
      "__v": 0
    },
    {
      "_id": "64677d7c1315b64a5328b1d1",
      "name": "Cabbage",
      "nameInBengali": "বাঁধাকপি",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 25,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:32.532Z",
      "updatedAt": "2023-05-19T13:45:32.532Z",
      "__v": 0
    },
    {
      "_id": "64677d7c1315b64a5328b1d3",
      "name": "Potato",
      "nameInBengali": "আলু",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 77,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:32.533Z",
      "updatedAt": "2023-05-19T13:45:32.533Z",
      "__v": 0
    },
    {
      "_id": "64677d7c1315b64a5328b1d7",
      "name": "Capsicum",
      "nameInBengali": "শিমলা মরিচ",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 31,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:32.537Z",
      "updatedAt": "2023-05-19T13:45:32.537Z",
      "__v": 0
    },
    {
      "_id": "64677d7c1315b64a5328b1dd",
      "name": "Radish",
      "nameInBengali": "মূলা",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 16,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:32.546Z",
      "updatedAt": "2023-05-19T13:45:32.546Z",
      "__v": 0
    },
    {
      "_id": "64677d7c1315b64a5328b1d5",
      "name": "Eggplant",
      "nameInBengali": "বেগুন",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 25,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:32.535Z",
      "updatedAt": "2023-05-19T13:45:32.535Z",
      "__v": 0
    },
    {
      "_id": "64677d7c1315b64a5328b1cb",
      "name": "Pumpkin",
      "nameInBengali": "কুমড়া",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 26,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:32.523Z",
      "updatedAt": "2023-05-19T13:45:32.523Z",
      "__v": 0
    },
    {
      "_id": "64677d7c1315b64a5328b1df",
      "name": "Green bean",
      "nameInBengali": "শিম",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 31,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:32.550Z",
      "updatedAt": "2023-05-19T13:45:32.550Z",
      "__v": 0
    },
    {
      "_id": "64677d7c1315b64a5328b1cf",
      "name": "Tomato",
      "nameInBengali": "টমেটো",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 18,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:32.529Z",
      "updatedAt": "2023-05-19T13:45:32.529Z",
      "__v": 0
    },
    {
      "_id": "64677d7d1315b64a5328b1ed",
      "name": "Ash gourd",
      "nameInBengali": "চালকুমড়ো",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 13,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:33.403Z",
      "updatedAt": "2023-05-19T13:45:33.403Z",
      "__v": 0
    },
    {
      "_id": "64677d7d1315b64a5328b1f9",
      "name": "Winter melon",
      "nameInBengali": "পেঠা",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 12,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:33.416Z",
      "updatedAt": "2023-05-19T13:45:33.416Z",
      "__v": 0
    },
    {
      "_id": "64677d7d1315b64a5328b1ef",
      "name": "Yam",
      "nameInBengali": "শালুক",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 118,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:33.404Z",
      "updatedAt": "2023-05-19T13:45:33.404Z",
      "__v": 0
    },
    {
      "_id": "64677d7d1315b64a5328b1f1",
      "name": "Cluster bean",
      "nameInBengali": "শিম",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 62,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:33.409Z",
      "updatedAt": "2023-05-19T13:45:33.409Z",
      "__v": 0
    },
    {
      "_id": "64677d7d1315b64a5328b1f3",
      "name": "Green papaya",
      "nameInBengali": "কাচা পেঁপে",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 43,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:33.411Z",
      "updatedAt": "2023-05-19T13:45:33.411Z",
      "__v": 0
    },
    {
      "_id": "64677d7d1315b64a5328b1f7",
      "name": "Elephant foot yam",
      "nameInBengali": "উচ্ছে",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 118,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:33.415Z",
      "updatedAt": "2023-05-19T13:45:33.415Z",
      "__v": 0
    },
    {
      "_id": "64677d7d1315b64a5328b1f5",
      "name": "Climbing spinach",
      "nameInBengali": "পুই শাক",
      "image": "",
      "typeByNutrients": [
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53933",
      "caloriesPerHundredGram": 21,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:33.413Z",
      "updatedAt": "2023-05-19T13:45:33.413Z",
      "__v": 0
    }
  ],
  "grains": [
    {
      "_id": "64677d701315b64a5328b0a5",
      "name": "Rice",
      "nameInBengali": "ভাত",
      "image": "",
      "typeByNutrients": ["Carbohydrates"],
      "category": "6466bfe8e62de0ed60e53937",
      "caloriesPerHundredGram": 130,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:20.537Z",
      "updatedAt": "2023-05-19T13:45:20.537Z",
      "__v": 0
    },
    {
      "_id": "64677d781315b64a5328b143",
      "name": "Bengali Mutton Curry",
      "nameInBengali": "মটন কারি",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "Carbohydrates",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53937",
      "caloriesPerHundredGram": 250,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:28.176Z",
      "updatedAt": "2023-05-19T13:45:28.176Z",
      "__v": 0
    }
  ],
  "protein": [
    {
      "_id": "64677d701315b64a5328b0a3",
      "name": "Chicken Breast",
      "nameInBengali": "চিকেন ব্রেস্ট",
      "image": "",
      "typeByNutrients": ["Protein"],
      "category": "6466bfe8e62de0ed60e53934",
      "caloriesPerHundredGram": 165,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:20.535Z",
      "updatedAt": "2023-05-19T13:45:20.535Z",
      "__v": 0
    },
    {
      "_id": "64677d711315b64a5328b0a9",
      "name": "Egg",
      "nameInBengali": "ডিম",
      "image": "",
      "typeByNutrients": ["Protein", "Fat"],
      "category": "6466bfe8e62de0ed60e53934",
      "caloriesPerHundredGram": 155,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:21.391Z",
      "updatedAt": "2023-05-19T13:45:21.391Z",
      "__v": 0
    },
    {
      "_id": "64677d701315b64a5328b0a1",
      "name": "Hilsa Fish",
      "nameInBengali": "ইলিশ মাছ",
      "image": "",
      "typeByNutrients": ["Protein", "Fat"],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 310,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:20.503Z",
      "updatedAt": "2023-05-19T13:45:20.503Z",
      "__v": 0
    },
    {
      "_id": "64677d711315b64a5328b0ad",
      "name": "Mutton",
      "nameInBengali": "ছাগলের মাংস",
      "image": "",
      "typeByNutrients": ["Protein", "Fat"],
      "category": "6466bfe8e62de0ed60e53934",
      "caloriesPerHundredGram": 250,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:21.397Z",
      "updatedAt": "2023-05-19T13:45:21.397Z",
      "__v": 0
    },
    {
      "_id": "64677d711315b64a5328b0af",
      "name": "Beef",
      "nameInBengali": "গরুর মাংস",
      "image": "",
      "typeByNutrients": ["Protein", "Fat"],
      "category": "6466bfe8e62de0ed60e53934",
      "caloriesPerHundredGram": 250,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:21.401Z",
      "updatedAt": "2023-05-19T13:45:21.401Z",
      "__v": 0
    },
    {
      "_id": "64677d711315b64a5328b0b1",
      "name": "Lentils",
      "nameInBengali": "মসুর ডাল",
      "image": "",
      "typeByNutrients": ["Protein", "Carbohydrates"],
      "category": "6466bfe8e62de0ed60e53938",
      "caloriesPerHundredGram": 350,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:21.403Z",
      "updatedAt": "2023-05-19T13:45:21.403Z",
      "__v": 0
    },
    {
      "_id": "64677d771315b64a5328b129",
      "name": "Chingri",
      "nameInBengali": "চিংড়ি",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "Carbohydrates",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 97,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:27.334Z",
      "updatedAt": "2023-05-19T13:45:27.334Z",
      "__v": 0
    },
    {
      "_id": "64677d771315b64a5328b12f",
      "name": "Telapia",
      "nameInBengali": "তেলাপিয়া",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "Carbohydrates",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 96,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:27.345Z",
      "updatedAt": "2023-05-19T13:45:27.345Z",
      "__v": 0
    },
    {
      "_id": "64677d771315b64a5328b127",
      "name": "Bhetki",
      "nameInBengali": "ভেটকি",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "Carbohydrates",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 105,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:27.331Z",
      "updatedAt": "2023-05-19T13:45:27.331Z",
      "__v": 0
    },
    {
      "_id": "64677d771315b64a5328b125",
      "name": "Katla",
      "nameInBengali": "কাতলা",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "Carbohydrates",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 109,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:27.326Z",
      "updatedAt": "2023-05-19T13:45:27.326Z",
      "__v": 0
    },
    {
      "_id": "64677d771315b64a5328b131",
      "name": "Pabda",
      "nameInBengali": "পাবদা",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "Carbohydrates",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 106,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:27.347Z",
      "updatedAt": "2023-05-19T13:45:27.347Z",
      "__v": 0
    },
    {
      "_id": "64677d781315b64a5328b14d",
      "name": "Koi",
      "nameInBengali": "কই",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "Carbohydrates",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 112,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:28.187Z",
      "updatedAt": "2023-05-19T13:45:28.187Z",
      "__v": 0
    },
    {
      "_id": "64677d771315b64a5328b137",
      "name": "Shorshe",
      "nameInBengali": "সরিষা",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53939",
      "caloriesPerHundredGram": 495,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:27.355Z",
      "updatedAt": "2023-05-19T13:45:27.355Z",
      "__v": 0
    },
    {
      "_id": "64677d771315b64a5328b139",
      "name": "Ilish",
      "nameInBengali": "ইলিশ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "Carbohydrates",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 280,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:27.357Z",
      "updatedAt": "2023-05-19T13:45:27.357Z",
      "__v": 0
    },
    {
      "_id": "64677d781315b64a5328b14f",
      "name": "Magur",
      "nameInBengali": "মাগুর",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "Carbohydrates",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 105,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:28.193Z",
      "updatedAt": "2023-05-19T13:45:28.193Z",
      "__v": 0
    },
    {
      "_id": "64677d781315b64a5328b13f",
      "name": "Shingi",
      "nameInBengali": "শিংগি",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "Carbohydrates",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 91,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:28.169Z",
      "updatedAt": "2023-05-19T13:45:28.169Z",
      "__v": 0
    },
    {
      "_id": "64677d771315b64a5328b13b",
      "name": "Rui",
      "nameInBengali": "রুই",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "Carbohydrates",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 96,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:27.360Z",
      "updatedAt": "2023-05-19T13:45:27.360Z",
      "__v": 0
    },
    {
      "_id": "64677d781315b64a5328b155",
      "name": "Singhi",
      "nameInBengali": "সিংহি",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "Carbohydrates",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 97,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:28.200Z",
      "updatedAt": "2023-05-19T13:45:28.200Z",
      "__v": 0
    },
    {
      "_id": "64677d781315b64a5328b149",
      "name": "Chitol",
      "nameInBengali": "চিতল",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "Carbohydrates",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 97,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:28.183Z",
      "updatedAt": "2023-05-19T13:45:28.183Z",
      "__v": 0
    },
    {
      "_id": "64677d781315b64a5328b153",
      "name": "Shol",
      "nameInBengali": "শোল",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "Carbohydrates",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 97,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:28.198Z",
      "updatedAt": "2023-05-19T13:45:28.198Z",
      "__v": 0
    },
    {
      "_id": "64677d781315b64a5328b151",
      "name": "Mola",
      "nameInBengali": "মোলা",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "Carbohydrates",
        "VitaminsAndMinerals"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 97,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:28.195Z",
      "updatedAt": "2023-05-19T13:45:28.195Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b179",
      "name": "Chickpea",
      "nameInBengali": "চণা ডাল",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53934",
      "caloriesPerHundredGram": 364,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.921Z",
      "updatedAt": "2023-05-19T13:45:29.921Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b17e",
      "name": "Red Lentil",
      "nameInBengali": "মসুর ডাল (স্ট্রাইপড)",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53934",
      "caloriesPerHundredGram": 352,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.937Z",
      "updatedAt": "2023-05-19T13:45:29.937Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b183",
      "name": "Black Gram",
      "nameInBengali": "বিট ডাল",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53934",
      "caloriesPerHundredGram": 347,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.945Z",
      "updatedAt": "2023-05-19T13:45:29.945Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b193",
      "name": "Lentil",
      "nameInBengali": "মসুর ডাল",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53934",
      "caloriesPerHundredGram": 353,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.972Z",
      "updatedAt": "2023-05-19T13:45:29.972Z",
      "__v": 0
    },
    {
      "_id": "64677d791315b64a5328b181",
      "name": "Green Gram",
      "nameInBengali": "মুগ ডাল",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fiber",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53934",
      "caloriesPerHundredGram": 347,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:45:29.943Z",
      "updatedAt": "2023-05-19T13:45:29.943Z",
      "__v": 0
    },
    {
      "_id": "64677db858665f2f21a82cbd",
      "name": "Rohu Fish",
      "nameInBengali": "রুই মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 97,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:32.773Z",
      "updatedAt": "2023-05-19T13:46:32.773Z",
      "__v": 0
    },
    {
      "_id": "64677db858665f2f21a82cbf",
      "name": "Katla Fish",
      "nameInBengali": "কাতলা মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 105,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:32.776Z",
      "updatedAt": "2023-05-19T13:46:32.776Z",
      "__v": 0
    },
    {
      "_id": "64677db858665f2f21a82cc1",
      "name": "Pangas Fish",
      "nameInBengali": "পাঙ্গাস মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 105,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:32.779Z",
      "updatedAt": "2023-05-19T13:46:32.779Z",
      "__v": 0
    },
    {
      "_id": "64677db858665f2f21a82cc5",
      "name": "Koi Fish",
      "nameInBengali": "কই মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 123,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:32.784Z",
      "updatedAt": "2023-05-19T13:46:32.784Z",
      "__v": 0
    },
    {
      "_id": "64677db858665f2f21a82ccb",
      "name": "Catfish",
      "nameInBengali": "শিং মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 105,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:32.795Z",
      "updatedAt": "2023-05-19T13:46:32.795Z",
      "__v": 0
    },
    {
      "_id": "64677db858665f2f21a82cd1",
      "name": "Salmon Fish",
      "nameInBengali": "স্যালমন মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 206,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:32.802Z",
      "updatedAt": "2023-05-19T13:46:32.802Z",
      "__v": 0
    },
    {
      "_id": "64677db858665f2f21a82ccd",
      "name": "Tilapia Fish",
      "nameInBengali": "তিলাপিয়া মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 96,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:32.798Z",
      "updatedAt": "2023-05-19T13:46:32.798Z",
      "__v": 0
    },
    {
      "_id": "64677db858665f2f21a82cc7",
      "name": "Pabda Fish",
      "nameInBengali": "পাবদা মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 134,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:32.787Z",
      "updatedAt": "2023-05-19T13:46:32.787Z",
      "__v": 0
    },
    {
      "_id": "64677dba58665f2f21a82ce5",
      "name": "Mackerel Fish",
      "nameInBengali": "আইলা মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 305,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:34.431Z",
      "updatedAt": "2023-05-19T13:46:34.431Z",
      "__v": 0
    },
    {
      "_id": "64677dba58665f2f21a82ce7",
      "name": "Kingfish",
      "nameInBengali": "রাজা মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 133,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:34.437Z",
      "updatedAt": "2023-05-19T13:46:34.437Z",
      "__v": 0
    },
    {
      "_id": "64677dba58665f2f21a82ce9",
      "name": "Tilapia Fish",
      "nameInBengali": "তিলাপিয়া মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 96,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:34.439Z",
      "updatedAt": "2023-05-19T13:46:34.439Z",
      "__v": 0
    },
    {
      "_id": "64677dba58665f2f21a82ceb",
      "name": "Shrimp",
      "nameInBengali": "চিংড়ি",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 106,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:34.448Z",
      "updatedAt": "2023-05-19T13:46:34.448Z",
      "__v": 0
    },
    {
      "_id": "64677dba58665f2f21a82ced",
      "name": "Haddock Fish",
      "nameInBengali": "হ্যাডক মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 116,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:34.450Z",
      "updatedAt": "2023-05-19T13:46:34.450Z",
      "__v": 0
    },
    {
      "_id": "64677dba58665f2f21a82cdf",
      "name": "Anchovy Fish",
      "nameInBengali": "আংচোভি মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 210,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:34.424Z",
      "updatedAt": "2023-05-19T13:46:34.424Z",
      "__v": 0
    },
    {
      "_id": "64677dba58665f2f21a82cdd",
      "name": "Red Snapper",
      "nameInBengali": "রেড স্নাপার মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 105,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:34.421Z",
      "updatedAt": "2023-05-19T13:46:34.421Z",
      "__v": 0
    },
    {
      "_id": "64677dba58665f2f21a82cd9",
      "name": "Bhetki Fish",
      "nameInBengali": "ভেটকি মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 105,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:34.412Z",
      "updatedAt": "2023-05-19T13:46:34.412Z",
      "__v": 0
    },
    {
      "_id": "64677dba58665f2f21a82cdb",
      "name": "Surmai Fish",
      "nameInBengali": "সুরমাই মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 137,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:34.418Z",
      "updatedAt": "2023-05-19T13:46:34.418Z",
      "__v": 0
    },
    {
      "_id": "64677dba58665f2f21a82ce1",
      "name": "Sardine Fish",
      "nameInBengali": "সার্ডিন মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 208,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:34.426Z",
      "updatedAt": "2023-05-19T13:46:34.426Z",
      "__v": 0
    },
    {
      "_id": "64677dba58665f2f21a82ce3",
      "name": "Prawn",
      "nameInBengali": "চিংড়ি",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 106,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:34.429Z",
      "updatedAt": "2023-05-19T13:46:34.429Z",
      "__v": 0
    },
    {
      "_id": "64677dba58665f2f21a82cef",
      "name": "Tuna Fish",
      "nameInBengali": "টুনা মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 184,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:34.452Z",
      "updatedAt": "2023-05-19T13:46:34.452Z",
      "__v": 0
    },
    {
      "_id": "64677dba58665f2f21a82cf1",
      "name": "Pomfret Fish",
      "nameInBengali": "পমফ্রেট মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 105,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:34.453Z",
      "updatedAt": "2023-05-19T13:46:34.453Z",
      "__v": 0
    },
    {
      "_id": "64677dba58665f2f21a82cf3",
      "name": "Pompano Fish",
      "nameInBengali": "পম্পানো মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 95,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:34.455Z",
      "updatedAt": "2023-05-19T13:46:34.455Z",
      "__v": 0
    },
    {
      "_id": "64677dba58665f2f21a82cf5",
      "name": "Seer Fish",
      "nameInBengali": "সিয়ার মাছ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53935",
      "caloriesPerHundredGram": 133,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:34.458Z",
      "updatedAt": "2023-05-19T13:46:34.458Z",
      "__v": 0
    }
  ],
  "dairy": [
    {
      "_id": "64677db758665f2f21a82cb5",
      "name": "Cow Milk",
      "nameInBengali": "গাভী দুধ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53936",
      "caloriesPerHundredGram": 42,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:31.925Z",
      "updatedAt": "2023-05-19T23:47:09.059Z",
      "__v": 0
    },
    {
      "_id": "64677db858665f2f21a82cb9",
      "name": "Yogurt",
      "nameInBengali": "দই",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53936",
      "caloriesPerHundredGram": 59,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:32.766Z",
      "updatedAt": "2023-05-19T23:48:20.754Z",
      "__v": 0
    },
    {
      "_id": "64677db758665f2f21a82cb7",
      "name": "Goat Milk",
      "nameInBengali": "ছাগলের দুধ",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53936",
      "caloriesPerHundredGram": 69,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:31.948Z",
      "updatedAt": "2023-05-19T23:47:50.738Z",
      "__v": 0
    },
    {
      "_id": "64677db858665f2f21a82cc3",
      "name": "Cheese",
      "nameInBengali": "পনির",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53936",
      "caloriesPerHundredGram": 402,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:32.782Z",
      "updatedAt": "2023-05-19T23:49:11.453Z",
      "__v": 0
    },
    {
      "_id": "64677db858665f2f21a82ccf",
      "name": "Butter",
      "nameInBengali": "মাখন",
      "image": "",
      "typeByNutrients": [
        "Protein",
        "Carbohydrates",
        "Fat",
        "VitaminsAndMinerals",
        "WaterAndDrinks"
      ],
      "category": "6466bfe8e62de0ed60e53936",
      "caloriesPerHundredGram": 717,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:32.800Z",
      "updatedAt": "2023-05-19T23:49:39.356Z",
      "__v": 0
    }
  ],
  "beverages": [],
  "oil": [
    {
      "_id": "64677db858665f2f21a82cbb",
      "name": "Soybean Oil",
      "nameInBengali": "সয়াবিন তেল",
      "image": "",
      "typeByNutrients": ["Fat", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e5393a",
      "caloriesPerHundredGram": 884,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:32.771Z",
      "updatedAt": "2023-05-19T23:42:29.828Z",
      "__v": 0
    },
    {
      "_id": "64677db858665f2f21a82cc9",
      "name": "Coconut Oil",
      "nameInBengali": "নারিকেল তেল",
      "image": "",
      "typeByNutrients": ["Fat", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e5393a",
      "caloriesPerHundredGram": 862,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:32.793Z",
      "updatedAt": "2023-05-19T23:42:29.828Z",
      "__v": 0
    },
    {
      "_id": "64677db858665f2f21a82cd3",
      "name": "Olive Oil",
      "nameInBengali": "জলেপাই তেল",
      "image": "",
      "typeByNutrients": ["Fat", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e5393a",
      "caloriesPerHundredGram": 884,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:32.805Z",
      "updatedAt": "2023-05-19T23:42:29.828Z",
      "__v": 0
    },
    {
      "_id": "64677db858665f2f21a82cd5",
      "name": "Sunflower Oil",
      "nameInBengali": "সূর্যমুখী তেল",
      "image": "",
      "typeByNutrients": ["Fat", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e5393a",
      "caloriesPerHundredGram": 884,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:32.809Z",
      "updatedAt": "2023-05-19T23:42:29.828Z",
      "__v": 0
    },
    {
      "_id": "64677db858665f2f21a82cd7",
      "name": "Mustard Oil",
      "nameInBengali": "সরিষা তেল",
      "image": "",
      "typeByNutrients": ["Fat", "VitaminsAndMinerals"],
      "category": "6466bfe8e62de0ed60e5393a",
      "caloriesPerHundredGram": 884,
      "isDeleted": false,
      "createdAt": "2023-05-19T13:46:32.812Z",
      "updatedAt": "2023-05-19T23:42:29.828Z",
      "__v": 0
    }
  ]
});
