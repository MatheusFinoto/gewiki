import 'package:flutter/material.dart';
import 'package:gw_wiki/core/constans/mapping_routes.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'core/constans/constants.dart';
import 'main_services.dart';
import 'main_state.dart';

void main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...MainServices.mountProviders(),
        ListenableProvider<MainState>(create: (_) => MainState(context)),
      ],
      child: Consumer<MainState>(builder: (_, state, __) {
        return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'GW WIKI',
            // locale: const Locale('pt', 'BR'),
            // supportedLocales: const [
            //   Locale('pt', 'BR'),
            // ],
            // localizationsDelegates: const [
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate
            // ],
            builder: (context, widget) => ResponsiveWrapper.builder(
                  BouncingScrollWrapper.builder(context, widget!),
                  minWidth: 450,
                  defaultScale: true,
                  breakpoints: const [
                    ResponsiveBreakpoint.resize(450, name: MOBILE),
                    ResponsiveBreakpoint.resize(800, name: TABLET),
                    ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                  ],
                ),
            theme: lightThemeData,
            darkTheme: darkThemeData,
            themeMode: state.themeMode,
            routerConfig: RouteConstants.router);
      }),
    );
  }
}
