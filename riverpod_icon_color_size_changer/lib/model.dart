import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 1)
class Model extends HiveObject {
  @HiveField(0)
  late double size;

  @HiveField(1)
  late int clr;
}