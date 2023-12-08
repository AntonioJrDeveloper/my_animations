import 'package:flutter/material.dart';

import 'package:my_animations/widgets/widgets.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('CustomPainter')),
      ),
      body: BodyWidget(size: size),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animatedPosicion;
  late double _value;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setAnimationContainer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  void _setAnimationContainer() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animatedPosicion =
        Tween<double>(begin: 0, end: (widget.size.height / 3) * 2)
            .animate(_controller);

    _animatedPosicion.addListener(() {
      setState(() {});
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.bottomCenter,
          child: Positioned.fill(
            child: Container(
              width: double.infinity,
              height: _animatedPosicion.value,
              decoration: const BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
            ),
          ),
        ),
        Positioned.fill(
          top: 100,
          child: Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            child: MaterialButton(
                onPressed: () {
                  setState(() {
                    _setAnimationContainer();
                  });
                },
                child: const HexagonoWidget(
                  icon: Icons.person,
                  color: Colors.yellow,
                )),
          ),
        ),
      ],
    );
  }
}
