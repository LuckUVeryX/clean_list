import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'router/router.dart';

/// Wraps the app so can navigate to any feature base on configs/flavors.
class AppWrapper extends StatefulWidget {
  const AppWrapper({Key? key}) : super(key: key);

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Navigate to page based on config.
    AutoRouter.of(context).replaceNamed(Routes.infiniteList);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
