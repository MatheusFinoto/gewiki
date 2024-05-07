
import 'package:gw_wiki/core/constans/mapping_db.dart';

class ProfessionDto{
  final String id;
  final String name;

  ProfessionDto.fromJson(json):
    id = json[TbProfessionConstants.id],
    name = json[TbProfessionConstants.name];
}