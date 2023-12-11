import 'package:flutter/material.dart';

import 'package:my_animations/mocks/mocks.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  double _currentIndex = 0;
  final _pageViewController = PageController(viewportFraction: 0.75);
  Offset _offset = Offset.zero;

  @override
  void initState() {
    // TODO: implement initState
    _pageViewController.addListener(() {
      setState(() {
        _currentIndex = _pageViewController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('PageView'),
          ),
        ),
        body: Expanded(
          child: PageView.builder(
            controller: _pageViewController,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            onPageChanged: (index) {
              _currentIndex = index.toDouble();
            },
            itemCount: Mocks.listCreditCards.length,
            itemBuilder: (_, index) {
              final double _scale = _currentIndex == index ? 1.0 : 0.8;
              return TweenAnimationBuilder(
                tween: Tween(begin: _scale, end: _scale),
                duration: const Duration(milliseconds: 350),
                child: Mocks.listCreditCards[index],
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
              );
            },
          ),
        ));
  }
}
