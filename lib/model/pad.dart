import 'dart:core';

class DailyPad {
  DailyPad(
      {this.id,
      required this.title,
      required this.description,
      required this.time,
      required this.status});
  int? id;
  String title;
  String description;
  String time;
  String status;

  factory DailyPad.fromMap(Map<String, dynamic> map) => DailyPad(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      time: map['time'] as String,
      status: map['status'] as String);

  Map<String, dynamic> joMap() => {
        'id': id,
        'title': title,
        'description': description,
        'time': time,
        'status': status 
      };
}
















// final String padName = 'pad';

// class PadField {
//   static final String id = '_id';
//   static final String isImportant = 'isImportant';
//   static final String type = 'type';
//   static final String number = 'number';
//   static final String title = 'title';
//   static final String description = 'description';
//   static final String time = 'time';
// }

// class Pad {
//   final int? id;
//   final bool isImportant;
//   final String type;
//   final int number;
//   final String title;
//   final String description;
//   final DateTime time;

//   Pad(
//       {this.id,
//       required this.isImportant,
//       required this.type,
//       required this.number,
//       required this.title,
//       required this.description,
//       required this.time});

//   Pad copy(int? id, bool? isImportant, String? type, int? number, String? title,
//           String? description, DateTime? time) =>
//       Pad(
//           isImportant: isImportant ?? this.isImportant,
//           type: type ?? this.type,
//           number: number ?? this.number,
//           title: title ?? this.title,
//           description: description ?? this.description,
//           time: time ?? this.time);

//   static Pad fromJson(Map<String, Object?> json) => Pad(
//       id: json[PadField.id] as int?,
//       isImportant: json[PadField.isImportant] == 1,
//       type: json[PadField.type] as String,
//       number: json[PadField.number] as int,
//       title: json[PadField.title] as String,
//       description: json[PadField.description] as String,
//       time: DateTime.parse(json[PadField.time] as String));

//   Map<String, Object?> toJson() => {
//         PadField.id: id,
//         PadField.isImportant: isImportant ? 1 : 0,
//         PadField.type: type,
//         PadField.number: number,
//         PadField.title: title,
//         PadField.description: description,
//         PadField.time: time.toIso8601String()
//       };
// }
