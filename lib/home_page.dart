import 'dart:math';

import 'package:flutter/material.dart';

import 'planets.dart';

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
            return Planets(day: (snapshot.data ?? 0));
          },
        ),
      ),
    );
  }
}

class Planets extends StatelessWidget {
  final double day;

  const Planets({super.key, required this.day});

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
        final size = constraints.biggest;
        final (centerX, centerY) = (size.width / 2, size.height / 2);

        final planets = Planet.values.indexed.map<Widget>((e) {
          final (idx, planet) = e;
          final maxRadius = min(size.width, size.height) / 2;
          final radius = maxRadius / Planet.values.length * (idx + 1);
          final angle = (day / 365 / planet.yearsToFullRotation) * 2 * pi;
          final (x, y) = calcPlanetPos(angle, radius);
          return Positioned(
            left: centerX + (x - planet.size / 2),
            bottom: centerY + (y - planet.size / 2),
            child: Icon(
              Icons.circle,
              size: planet.size,
              color: planet.color,
            ),
          );
        });
        return Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Icon(Icons.sunny, size: 86, color: Colors.yellow),
            ),
            ...planets
          ],
        );
      },
    );
  }
}
