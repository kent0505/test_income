import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class IncomeModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String target;
  @HiveField(2)
  int amount;
  @HiveField(3)
  String category;
  @HiveField(4)
  bool income;

  IncomeModel({
    required this.id,
    required this.target,
    required this.amount,
    required this.category,
    required this.income,
  });
}

class ExpenseAdapter extends TypeAdapter<IncomeModel> {
  @override
  final typeId = 0;

  @override
  IncomeModel read(BinaryReader reader) {
    return IncomeModel(
      id: reader.read(),
      target: reader.read(),
      amount: reader.read(),
      category: reader.read(),
      income: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, IncomeModel obj) {
    writer.write(obj.id);
    writer.write(obj.target);
    writer.write(obj.amount);
    writer.write(obj.category);
    writer.write(obj.income);
  }
}
