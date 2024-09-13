import 'package:intl/intl.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Program {
  @Id()
  int id = 0;
  String? code;

  String? output;
  String? language;
  String? languageCode;
  int? languageCodeIndex;

  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime date;

  Program({
    this.id = 0,
    this.code,
    this.output,
    this.language,
    this.languageCode,
    this.languageCodeIndex,
    DateTime? date,
  }) : date = date ?? DateTime.now();

  String get dateFormat => DateFormat('dd.MM.yyyy hh:mm:ss').format(date);
}

