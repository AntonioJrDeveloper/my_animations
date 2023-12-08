import 'package:flutter/material.dart';

import 'package:my_animations/mocks/mocks.dart';

class PageViewPage extends StatelessWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('PageView'),
          ),
        ),
        body: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Mocks.listCreditCards.length,
          itemBuilder: (_, index) => Mocks.listCreditCards[index],
        ));
  }
}
