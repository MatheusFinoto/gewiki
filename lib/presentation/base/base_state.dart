


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseState extends ChangeNotifier{
  final BuildContext context;
  BaseState(this.context){
    _init();
  }

  void _init()async {
    
  }

  String get currentRoute {
    return GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
  } 
  
}