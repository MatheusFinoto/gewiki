// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:gw_wiki/domain/professions/dtos/profession_dto.dart';

class Profession {
  final String id;
  final String name;

  Profession({
    required this.id,
    required this.name,
  });

  Profession copyWith({
    String? id,
    String? name,
  }) {
    return Profession(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Profession.fromMap(Map<String, dynamic> map) {
    return Profession(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profession.fromJson(String source) =>
      Profession.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Profession(id: $id, name: $name)';

  @override
  bool operator ==(covariant Profession other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  factory Profession.fromDto(ProfessionDto dto) {
    return Profession(
      id: dto.id,
      name: dto.name,
    );
  }
}
