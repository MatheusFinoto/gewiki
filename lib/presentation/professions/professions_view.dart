import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gw_wiki/core/constans/mapping_colors.dart';
import 'package:gw_wiki/presentation/professions/pages/profession_page_view.dart';
import 'package:gw_wiki/presentation/shared/sidebar/sidebar_view.dart';
import 'package:provider/provider.dart';

import 'professions_state.dart';

class ProfessionsView extends StatefulWidget {
  const ProfessionsView({super.key});

  @override
  State<ProfessionsView> createState() => _ProfessionsViewState();
}

class _ProfessionsViewState extends State<ProfessionsView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    return ChangeNotifierProvider(
        create: (_) => ProfessionsState(context, this),
        child: Consumer<ProfessionsState>(builder: (_, state, __) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Scaffold(
              body: Row(
            children: [
              const SidebarView(),
              Expanded(
                  child: Center(
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 1200,
                      maxHeight: size.height,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorsConstants.bg200,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Text(
                                    'Professions',
                                    style: textTheme.headlineMedium,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            TabBar(
                              controller: state.tabController,
                              indicator: const UnderlineTabIndicator(),
                              labelStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              indicatorColor: Colors.black,
                              labelColor: Colors.black,
                              dividerColor: Colors.black45,
                              unselectedLabelColor: Colors.black45,
                              automaticIndicatorColorAdjustment: false,
                              indicatorWeight: 3,
                              isScrollable: true,
                              indicatorSize: TabBarIndicatorSize.tab,
                              tabs: state.professions
                                  .map((e) => Tab(text: e.name))
                                  .toList(),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: state.tabController,
                                children: state.professions.map((e) =>ProfessionPageView(profession: e)).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ))
            ],
          ));
        }));
  }
}
