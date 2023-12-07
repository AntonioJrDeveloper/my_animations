import 'package:flutter/material.dart';

import 'package:my_animations/design/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(
          child: Text('My Animations'),
        )),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AppRoutes.containerPage),
                  child: const Text('Container Page')),
            ],
          ),
        )));
  }
}
