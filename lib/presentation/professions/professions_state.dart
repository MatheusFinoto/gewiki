import 'package:flutter/material.dart';
import 'package:gw_wiki/domain/professions/repositories/professions_repository.dart';
import 'package:provider/provider.dart';

import '../../domain/professions/entities/profession.dart';

class ProfessionsState extends ChangeNotifier {
  final BuildContext context;
  final TickerProvider vsync;
  late TabController tabController;
  ProfessionsState(this.context, this.vsync) {
    _init();
  }

  bool loading = false;

  List<Profession> professions = [];

  void _init() async {
    getProfessions();
  }

  void getProfessions() async {
    loading = true;
    notifyListeners();
    final result = await context.read<ProfessionsUsecase>().getProfessions();
    result.fold((l) {}, (r) {
      professions = r;
      tabController = TabController(
        length: professions.length,
        vsync: vsync,
      );
    });

    loading = false;
    notifyListeners();
  }
}
