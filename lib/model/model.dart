import 'package:hive_flutter/adapters.dart';
part 'model.g.dart';


@HiveType(typeId: 0)
class Studentmodel {
  
  
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String age;

  @HiveField(2)
  final String phone;

  @HiveField(3)
  final String adress;

  Studentmodel(
      {required this.name,
      required this.age,
      required this.phone,
      required this.adress
      });
  
}