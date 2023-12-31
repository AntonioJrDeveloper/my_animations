import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'package:gap/gap.dart';

class CreditCardWidget extends StatefulWidget {
  const CreditCardWidget({Key? key}) : super(key: key);

  @override
  State<CreditCardWidget> createState() => _CreditCardWidgetState();
}

class _CreditCardWidgetState extends State<CreditCardWidget> {
  Offset _offset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..rotateX(0.01 * _offset.dx)
        ..rotateY(0.01 * _offset.dy),
      alignment: FractionalOffset.center,
      child: GestureDetector(
        onPanUpdate: (details) => setState(() => _offset += details.delta),
        onDoubleTap: () => setState(() => _offset = Offset.zero),
        child: Center(
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color.fromRGBO(1, 138, 190, 1),
                          Color.fromRGBO(151, 202, 219, 1),
                          Color.fromRGBO(214, 232, 238, 1),
                        ])),
              ),
              Positioned.fill(
                  top: 20,
                  left: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'BBVA',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      const Gap.expand(10),
                      Row(
                        children: <Widget>[
                          Transform.rotate(
                              angle: math.pi / 2,
                              child: const Icon(
                                Icons.wifi_sharp,
                                color: Colors.white70,
                                size: 20,
                              )),
                          Icon(
                            Icons.width_full,
                            color: Colors.amber.shade200,
                            size: 40,
                          )
                        ],
                      ),
                      const Gap.expand(30),
                      Container(
                          margin: const EdgeInsets.only(right: 25),
                          alignment: Alignment.bottomRight,
                          child: const Text(
                            'VISA',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
