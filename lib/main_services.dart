



import 'package:gw_wiki/domain/professions/repositories/professions_repository.dart';
import 'package:gw_wiki/repositories/datastore.dart';
import 'package:provider/provider.dart';

import 'domain/professions/usecases/professions_usecase.dart';
import 'repositories/datastore/profession_datastore.dart';

class MainServices {
  static List<Provider> mountProviders() {
    final ProfessionsDatastore professionsDatastore = newProfessionsDatastore();
    final ProfessionsUsecase professionsUsecase = newProfessionsUsecase(professionsDatastore);

    
    return [
        Provider<ProfessionsUsecase>(create: (_) => professionsUsecase),
    ];
  }
}
