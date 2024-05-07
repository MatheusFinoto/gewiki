// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProfessionIngredientsFilter {
  final String professionId;
  ProfessionIngredientsFilter({
    required this.professionId,
  });

  ProfessionIngredientsFilter copyWith({
    String? professionId,
  }) {
    return ProfessionIngredientsFilter(
      professionId: professionId ?? this.professionId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'professionId': professionId,
    };
  }

  factory ProfessionIngredientsFilter.fromMap(Map<String, dynamic> map) {
    return ProfessionIngredientsFilter(
      professionId: map['professionId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfessionIngredientsFilter.fromJson(String source) =>
      ProfessionIngredientsFilter.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProfessionsIngredientsFilter(professionId: $professionId)';

  @override
  bool operator ==(covariant ProfessionIngredientsFilter other) {
    if (identical(this, other)) return true;

    return other.professionId == professionId;
  }

  @override
  int get hashCode => professionId.hashCode;
}
