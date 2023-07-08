// To parse this JSON data, do
//
//     final mailListResponse = mailListResponseFromMap(jsonString);

import 'dart:convert';

MailListResponse mailListResponseFromMap(String str) => MailListResponse.fromMap(json.decode(str));

String mailListResponseToMap(MailListResponse data) => json.encode(data.toMap());

class MailListResponse {
  List<HydraMemberMail>? hydraMember;
  int? hydraTotalItems;
  HydraView? hydraView;
  HydraSearch? hydraSearch;

  MailListResponse({
    this.hydraMember,
    this.hydraTotalItems,
    this.hydraView,
    this.hydraSearch,
  });

  factory MailListResponse.fromMap(Map<String, dynamic> json) => MailListResponse(
    hydraMember: json["hydra:member"] == null ? [] : List<HydraMemberMail>.from(json["hydra:member"]!.map((x) => HydraMemberMail.fromMap(x))),
    hydraTotalItems: json["hydra:totalItems"],
    hydraView: json["hydra:view"] == null ? null : HydraView.fromMap(json["hydra:view"]),
    hydraSearch: json["hydra:search"] == null ? null : HydraSearch.fromMap(json["hydra:search"]),
  );

  Map<String, dynamic> toMap() => {
    "hydra:member": hydraMember == null ? [] : List<dynamic>.from(hydraMember!.map((x) => x.toMap())),
    "hydra:totalItems": hydraTotalItems,
    "hydra:view": hydraView?.toMap(),
    "hydra:search": hydraSearch?.toMap(),
  };
}

class HydraMemberMail {
  String? id;
  String? type;
  String? context;
  String? hydraMemberId;
  String? accountId;
  String? msgid;
  From? from;
  List<From>? to;
  String? subject;
  String? intro;
  bool? seen;
  bool? isDeleted;
  bool? hasAttachments;
  int? size;
  String? downloadUrl;
  DateTime? createdAt;
  DateTime? updatedAt;

  HydraMemberMail({
    this.id,
    this.type,
    this.context,
    this.hydraMemberId,
    this.accountId,
    this.msgid,
    this.from,
    this.to,
    this.subject,
    this.intro,
    this.seen,
    this.isDeleted,
    this.hasAttachments,
    this.size,
    this.downloadUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory HydraMemberMail.fromMap(Map<String, dynamic> json) => HydraMemberMail(
    id: json["@id"],
    type: json["@type"],
    context: json["@context"],
    hydraMemberId: json["id"],
    accountId: json["accountId"],
    msgid: json["msgid"],
    from: json["from"] == null ? null : From.fromMap(json["from"]),
    to: json["to"] == null ? [] : List<From>.from(json["to"]!.map((x) => From.fromMap(x))),
    subject: json["subject"],
    intro: json["intro"],
    seen: json["seen"],
    isDeleted: json["isDeleted"],
    hasAttachments: json["hasAttachments"],
    size: json["size"],
    downloadUrl: json["downloadUrl"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toMap() => {
    "@id": id,
    "@type": type,
    "@context": context,
    "id": hydraMemberId,
    "accountId": accountId,
    "msgid": msgid,
    "from": from?.toMap(),
    "to": to == null ? [] : List<dynamic>.from(to!.map((x) => x.toMap())),
    "subject": subject,
    "intro": intro,
    "seen": seen,
    "isDeleted": isDeleted,
    "hasAttachments": hasAttachments,
    "size": size,
    "downloadUrl": downloadUrl,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class From {
  String? address;
  String? name;

  From({
    this.address,
    this.name,
  });

  factory From.fromMap(Map<String, dynamic> json) => From(
    address: json["address"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "address": address,
    "name": name,
  };
}

class HydraSearch {
  String? type;
  String? hydraTemplate;
  String? hydraVariableRepresentation;
  List<HydraMapping>? hydraMapping;

  HydraSearch({
    this.type,
    this.hydraTemplate,
    this.hydraVariableRepresentation,
    this.hydraMapping,
  });

  factory HydraSearch.fromMap(Map<String, dynamic> json) => HydraSearch(
    type: json["@type"],
    hydraTemplate: json["hydra:template"],
    hydraVariableRepresentation: json["hydra:variableRepresentation"],
    hydraMapping: json["hydra:mapping"] == null ? [] : List<HydraMapping>.from(json["hydra:mapping"]!.map((x) => HydraMapping.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "@type": type,
    "hydra:template": hydraTemplate,
    "hydra:variableRepresentation": hydraVariableRepresentation,
    "hydra:mapping": hydraMapping == null ? [] : List<dynamic>.from(hydraMapping!.map((x) => x.toMap())),
  };
}

class HydraMapping {
  String? type;
  String? variable;
  String? property;
  bool? required;

  HydraMapping({
    this.type,
    this.variable,
    this.property,
    this.required,
  });

  factory HydraMapping.fromMap(Map<String, dynamic> json) => HydraMapping(
    type: json["@type"],
    variable: json["variable"],
    property: json["property"],
    required: json["required"],
  );

  Map<String, dynamic> toMap() => {
    "@type": type,
    "variable": variable,
    "property": property,
    "required": required,
  };
}

class HydraView {
  String? id;
  String? type;
  String? hydraFirst;
  String? hydraLast;
  String? hydraPrevious;
  String? hydraNext;

  HydraView({
    this.id,
    this.type,
    this.hydraFirst,
    this.hydraLast,
    this.hydraPrevious,
    this.hydraNext,
  });

  factory HydraView.fromMap(Map<String, dynamic> json) => HydraView(
    id: json["@id"],
    type: json["@type"],
    hydraFirst: json["hydra:first"],
    hydraLast: json["hydra:last"],
    hydraPrevious: json["hydra:previous"],
    hydraNext: json["hydra:next"],
  );

  Map<String, dynamic> toMap() => {
    "@id": id,
    "@type": type,
    "hydra:first": hydraFirst,
    "hydra:last": hydraLast,
    "hydra:previous": hydraPrevious,
    "hydra:next": hydraNext,
  };
}
