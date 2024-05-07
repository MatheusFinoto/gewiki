

import 'package:flutter/material.dart';
import 'package:gw_wiki/presentation/shared/sidebar/sidebar_view.dart';
import 'package:provider/provider.dart';

import 'home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => HomeState(context),
        child: Consumer<HomeState>(builder: (_, state, __) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
            ),
            body: const Row(
              children: [
                SidebarView(),
              ],
            )
          );
        }));
  }
}