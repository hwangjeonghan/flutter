import 'dart:convert';

import 'package:h_flutter_example_project/models/NumberItem.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class NumberService {
  Box<NumberItem>? _numberBox;

  Future<List<NumberItem>?> initializeHive() async {
    _numberBox = await Hive.openBox<NumberItem>("numberBox");
    List<NumberItem>? numbers = _numberBox?.values.toList();
    return numbers;
  }

  Future<void> deleteCoffeeItem(int index) async {
    await _numberBox?.deleteAt(index);
  }

  Future<void> addCoffeeItem(NumberItem coffeeItem) async{
    await _numberBox?.add(coffeeItem);
  }


  //
  // Future<List<NumberItem>> fetchCoffeeItems() async {
  //   if (_coffeeBox!.isNotEmpty) {
  //     // coffeebox의 데이터를 list 형식으로 반환함.
  //     return _coffeeBox!.values.toList();
  //   }
  //
  //   const url = "https://api.sampleapis.com/coffee/hot";
  //
  //   try {
  //     final response = await http.get(Uri.parse(url));
  //
  //     if (response.statusCode == 200) {
  //       List<dynamic> fetchedItems = json.decode(response.body);
  //
  //       List<NumberItem> coffeeItems =
  //           fetchedItems.map((item) => Num.fromJson(item)).toList();
  //
  //       for (var coffee in coffeeItems) {
  //         _coffeeBox!.add(coffee);
  //       }
  //       return coffeeItems;
  //
  //     } else {
  //       print("요청 실패 : ${response.statusCode}");
  //       return [];
  //     }
  //   } catch (e) {
  //     print("에러 발생 : $e");
  //     return [];
  //   }
  // }

}
