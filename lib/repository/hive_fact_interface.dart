import 'package:hive/hive.dart';

part 'hive_fact_interface.g.dart';

@HiveType(typeId: 1)
class Fact {
  Fact({ required this.text, required this.createdAt});


  @HiveField(0)
  String text;

  @HiveField(1)
  String createdAt;

  @override
  String toString() {
    return '$text: $createdAt';
  }
}
