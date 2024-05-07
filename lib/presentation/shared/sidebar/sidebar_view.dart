import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gw_wiki/core/constans/mapping_colors.dart';
import 'package:gw_wiki/utils/functions.dart';
import '../../../core/constans/mapping_routes.dart';
class SidebarView extends StatelessWidget {
  const SidebarView({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 250,
      height: double.infinity,
      child: 
       Column(
        children: [
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home, color: isThisPage(context, RouteConstants.home)? ColorsConstants.primary100 : ColorsConstants.text100 ),
            onTap: () => context.go( RouteConstants.home),
          ),
          ListTile(
            title: Text('Professions'),
            leading: Icon(Icons.work),
            onTap: () => context.go(RouteConstants.professions),
          )
        ],
      ),
    );
  }
}