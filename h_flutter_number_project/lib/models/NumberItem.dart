
import 'package:hive/hive.dart';

part "NumberItem.g.dart";
// flutter pub get
// flutter pub run build_runner build

@HiveType(typeId: 0)
class NumberItem{
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? description;

  @HiveField(2)
  String? phoneNumber;

  @HiveField(3)
  String? image;

  NumberItem({required this.title,required this.description,required this.phoneNumber,required this.image});
  NumberItem.empty();


}