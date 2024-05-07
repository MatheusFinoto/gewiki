

import 'package:flutter/material.dart';
import 'package:gw_wiki/presentation/shared/sidebar/sidebar_view.dart';
import 'package:provider/provider.dart';

import 'base_state.dart';

class BaseView extends StatelessWidget {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:  (_) => BaseState(context), 
    child: Consumer<BaseState>(builder: (_, state, __){
        return Scaffold(
          body: 
           Row(
            children: [
              SidebarView(),
              // Expanded(
              //   child: ProfessionsView(),
              // )
            ],
          ),
        );
      }
    )
    );
  }
}

