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
    double angle,
    double radius,
  ) =>
      (
        radius * cos(angle),
        radius * sin(angle),
      );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const earthSize = 32.0;
        const moonSize = 8.0;
        final size = constraints.biggest;
        final (centerX, centerY) = (size.width / 2, size.height / 2);
        final earthRadius = min(size.width, size.height) / 4;
        final (earthX, earthY) = calcPlanetPos(
          earthAngle,
          earthRadius,
        );
        final (moonX, moonY) = calcPlanetPos(
          earthAngle * 5,
          earthRadius / 3,
        );
        return Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Icon(Icons.sunny, size: 86, color: Colors.yellow),
            ),
            Positioned(
              left: centerX + (earthX - earthSize / 2),
              bottom: centerY + (earthY - earthSize / 2),
              child: const Icon(
                Icons.circle,
                size: earthSize,
                color: Colors.green,
              ),
            ),
            Positioned(
              left: centerX + earthX + (moonX - moonSize / 2),
              bottom: centerY + earthY + (moonY - moonSize / 2),
              child: const Icon(
                Icons.circle,
                size: moonSize,
                color: Colors.grey,
              ),
            ),
          ],
        );
      },
    );
  }
}
