import 'package:flutter/material.dart';

enum Planet {
  // Thanx chat gpt!
  mercury(size: 16, yearsToFullRotation: 0.2408467, color: Color(0xFFA9A9A9)),
  venus(size: 20, yearsToFullRotation: 0.61519726, color: Color(0xFFFFC300)),
  earth(size: 18, yearsToFullRotation: 1.0, color: Color(0xFF007AC1)),
  mars(size: 16, yearsToFullRotation: 1.8808158, color: Color(0xFFD14F32)),
  jupiter(size: 28, yearsToFullRotation: 11.862615, color: Color(0xFFD9A667)),
  saturn(size: 26, yearsToFullRotation: 29.447498, color: Color(0xFFE0C390)),
  uranus(size: 22, yearsToFullRotation: 84.016846, color: Color(0xFF7EB8E2)),
  neptune(size: 24, yearsToFullRotation: 164.79132, color: Color(0xFF455EC7));

  const Planet({
    required this.size,
    required this.yearsToFullRotation,
    required this.color,
  });

  final double size;
  final double yearsToFullRotation;
  final Color color;
}
