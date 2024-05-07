import '../../../core/constans/mapping_db.dart';

class ProfessionMaterialDto {
  final int id;
  final String name;
  final int? previusId;
  final int? nextId;

  ProfessionMaterialDto.fromJson(json)
      : id = json[TbProfessionsMaterialsConstants.id],
        name = json[TbProfessionsMaterialsConstants.name],
        previusId = json[TbProfessionsMaterialsConstants.previusId],
        nextId = json[TbProfessionsMaterialsConstants.nextId];
}
