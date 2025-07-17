import 'package:hive/hive.dart';

part 'medication_model.g.dart';

@HiveType(typeId: 0)
class Medication extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String dose;

  @HiveField(2)
  String time;

  @HiveField(3)
  bool isTaken;

  Medication({
    required this.name,
    required this.dose,
    required this.time,
    this.isTaken = false,
  });
}
