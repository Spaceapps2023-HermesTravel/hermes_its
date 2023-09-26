import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ResHermes')),
      body: Container(
        color: Colors.blueAccent,
        child: StreamBuilder<double>(
          stream: Stream.periodic(
            const Duration(milliseconds: 10),
            (i) => i.toDouble(),
          ),
          builder: (context, snapshot) {
            return Planets(
              earthAngle: (snapshot.data ?? 0) / 80,
            );
          },
        ),
      ),
    );
  }
}

class Planets extends StatelessWidget {
  final double earthAngle;

  const Planets({super.key, required this.earthAngle});

  (double, double) calcPlanetPos(
    Size widgetSize,
    double angle,
    double radius,
  ) =>
      (
        radius * cos(angle) - widgetSize.width / 2,
        radius * sin(angle) - widgetSize.height / 2,
      );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const earthSize = 32.0;
        final size = constraints.biggest;
        final (centerX, centerY) = (size.width / 2, size.height / 2);
        final (earthX, earthY) = calcPlanetPos(
          const Size.square(earthSize),
          earthAngle,
          min(size.width, size.height) / 4,
        );
        return Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Icon(Icons.sunny, size: 86, color: Colors.yellow),
            ),
            Positioned(
              left: centerX + earthX,
              bottom: centerY + earthY,
              child: const Icon(
                Icons.circle,
                size: earthSize,
                color: Colors.green,
              ),
            )
          ],
        );
      },
    );
  }
}
