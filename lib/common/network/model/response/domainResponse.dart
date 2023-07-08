import 'dart:convert';

DomainResponse domainResponseFromMap(String str) => DomainResponse.fromMap(json.decode(str));

String domainResponseToMap(DomainResponse data) => json.encode(data.toMap());

class DomainResponse {
  String? context;
  String? id;
  String? type;
  List<HydraMember>? hydraMember;
  int? hydraTotalItems;

  DomainResponse({
    this.context,
    this.id,
    this.type,
    this.hydraMember,
    this.hydraTotalItems,
  });

  factory DomainResponse.fromMap(Map<String, dynamic> json) => DomainResponse(
    context: json["@context"],
    id: json["@id"],
    type: json["@type"],
    hydraMember: json["hydra:member"] == null ? [] : List<HydraMember>.from(json["hydra:member"]!.map((x) => HydraMember.fromMap(x))),
    hydraTotalItems: json["hydra:totalItems"],
  );

  Map<String, dynamic> toMap() => {
    "@context": context,
    "@id": id,
    "@type": type,
    "hydra:member": hydraMember == null ? [] : List<dynamic>.from(hydraMember!.map((x) => x.toMap())),
    "hydra:totalItems": hydraTotalItems,
  };
}

class HydraMember {
  String? id;
  String? type;
  String? hydraMemberId;
  String? domain;
  bool? isActive;
  bool? isPrivate;
  DateTime? createdAt;
  DateTime? updatedAt;

  HydraMember({
    this.id,
    this.type,
    this.hydraMemberId,
    this.domain,
    this.isActive,
    this.isPrivate,
    this.createdAt,
    this.updatedAt,
  });

  factory HydraMember.fromMap(Map<String, dynamic> json) => HydraMember(
    id: json["@id"],
    type: json["@type"],
    hydraMemberId: json["id"],
    domain: json["domain"],
    isActive: json["isActive"],
    isPrivate: json["isPrivate"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toMap() => {
    "@id": id,
    "@type": type,
    "id": hydraMemberId,
    "domain": domain,
    "isActive": isActive,
    "isPrivate": isPrivate,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
