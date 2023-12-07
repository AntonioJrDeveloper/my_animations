import 'package:flutter/material.dart';

import 'package:my_animations/design/app_routes.dart';
import 'package:my_animations/pages/pages.dart';

class MyAnimations extends StatelessWidget {
  const MyAnimations({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.containerPage:
            return MaterialPageRoute(
              builder: (_) => const ContainerPage(),
            );
          default:
            return MaterialPageRoute(builder: (_) => const HomePage());
        }
      },
    );
  }
}
