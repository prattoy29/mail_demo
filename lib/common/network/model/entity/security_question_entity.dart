import 'dart:convert';

GetSecurityQuestionEntity getSecurityQuestionsFromJson(String str) =>
    GetSecurityQuestionEntity.fromJson(json.decode(str));

class GetSecurityQuestionEntity {
  GetSecurityQuestionEntity({
    required this.id,
    required this.question,
    required this.created,
    required this.updated,

  });

  int id = 0;
  String question = "";
  String created = "";
  String updated = "";


  factory GetSecurityQuestionEntity.fromJson(Map<String, dynamic> json) => GetSecurityQuestionEntity(
    id: json["id"],
    question: json["question"],
    created: json["created_at"],
    updated: json["updated_at"],
  );
}
