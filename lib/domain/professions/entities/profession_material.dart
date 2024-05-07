// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../dtos/profession_material_dto.dart';

class ProfessionMaterial {
  final int id;
  final String name;
  final int? previusId;
  final int? nextId;
  ProfessionMaterial({
    required this.id,
    required this.name,
    required this.previusId,
    required this.nextId,
  });

  ProfessionMaterial copyWith({
    int? id,
    String? name,
    int? previusId,
    int? nextId,
  }) {
    return ProfessionMaterial(
      id: id ?? this.id,
      name: name ?? this.name,
      previusId: previusId ?? this.previusId,
      nextId: nextId ?? this.nextId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'previusId': previusId,
      'nextId': nextId,
    };
  }

  factory ProfessionMaterial.fromMap(Map<String, dynamic> map) {
    return ProfessionMaterial(
      id: map['id'] as int,
      name: map['name'] as String,
      previusId: map['previusId'] as int,
      nextId: map['nextId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfessionMaterial.fromJson(String source) =>
      ProfessionMaterial.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfessionsMaterial(id: $id, name: $name, previusId: $previusId, nextId: $nextId)';
  }

  @override
  bool operator ==(covariant ProfessionMaterial other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.previusId == previusId &&
        other.nextId == nextId;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ previusId.hashCode ^ nextId.hashCode;
  }

  factory ProfessionMaterial.fromDto(ProfessionMaterialDto dto) {
    return ProfessionMaterial(
      id: dto.id,
      name: dto.name,
      previusId: dto.previusId,
      nextId: dto.nextId,
    );
  }
}
