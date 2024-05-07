




import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

bool isThisPage(BuildContext context, String route){
  return GoRouter.of(context).routerDelegate.currentConfiguration.fullPath == route;
}