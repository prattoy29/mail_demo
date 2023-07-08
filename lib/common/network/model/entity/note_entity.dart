import 'dart:convert';

GetNoteEntity getnoteActivityFromJson(String str) =>
    GetNoteEntity.fromJson(json.decode(str));

class GetNoteEntity {
  GetNoteEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.reminder_date,
    required this.color,
    required this.created,
    required this.updated,
  });

  int id = 0;
  String title = "";
  String description = "";
  String reminder_date = "";
  int color = 0;
  String created = "";
  String updated = "";

  factory GetNoteEntity.fromJson(Map<String, dynamic> json) => GetNoteEntity(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        reminder_date: json["reminder_date"],
        color: json["color"],
        created: json["created"],
        updated: json["updated"],
      );
}
