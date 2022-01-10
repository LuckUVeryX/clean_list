import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'core/observers/observers.dart';
import 'core/router/router.gr.dart';

void main() {
  // Sets the logging level.
  Logger.level = Level.info;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Clean List',
      themeMode: ThemeMode.dark,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(
        navigatorObservers: () => [RouterLoggingObserver()],
      ),
    );
  }
}
