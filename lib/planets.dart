import 'package:flutter/material.dart';

enum Planet {
  // Thanx chat gpt!
  mercury(size: 16, yearsToFullRotation: 0.2408467, color: Colors.grey),
  venus(size: 20, yearsToFullRotation: 0.61519726, color: Colors.orangeAccent),
  earth(size: 18, yearsToFullRotation: 1.0, color: Colors.green),
  mars(size: 16, yearsToFullRotation: 1.8808158, color: Colors.orange),
  jupiter(size: 28, yearsToFullRotation: 11.862615, color: Colors.amberAccent),
  saturn(size: 26, yearsToFullRotation: 29.447498, color: Colors.yellow),
  uranus(size: 22, yearsToFullRotation: 84.016846, color: Colors.blueGrey),
  neptune(size: 24, yearsToFullRotation: 164.79132, color: Colors.blueAccent);

  const Planet({
    required this.size,
    required this.yearsToFullRotation,
    required this.color,
  });

  final double size;
  final double yearsToFullRotation;
  final Color color;
}
