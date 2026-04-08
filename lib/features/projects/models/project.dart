import 'package:flutter/material.dart';

class Project {
  const Project({
    required this.number,
    required this.name,
    required this.type,
    required this.description,
    required this.tech,
    required this.links,
    required this.accent,
  });

  factory Project.fromMap(Map<String, dynamic> map) {
    final hexStr = (map['accentHex'] as String).replaceFirst('#', 'FF');
    return Project(
      number: map['number'] as String,
      name: map['name'] as String,
      type: map['type'] as String,
      description: map['description'] as String,
      tech: (map['tech'] as List).cast<String>(),
      links: (map['links'] as Map<String, dynamic>).cast<String, String>(),
      accent: Color(int.parse(hexStr, radix: 16)),
    );
  }

  final String number;
  final String name;
  final String type;
  final String description;
  final List<String> tech;
  final Map<String, String> links;
  final Color accent;
}
