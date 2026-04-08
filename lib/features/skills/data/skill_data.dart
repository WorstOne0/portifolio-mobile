import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:portifolio_mobile/styles/app_theme.dart';
import 'package:simple_icons/simple_icons.dart';

// ─── Skill item ──────────────────────────────────────────────────────────────

class SkillItem {
  const SkillItem({required this.name, required this.color, this.faIcon});

  final String name;
  final Color color;
  final IconData? faIcon;
}

// ─── Skill category ──────────────────────────────────────────────────────────

class SkillCategory {
  const SkillCategory({
    required this.translationKey,
    required this.categoryIcon,
    required this.color,
    required this.skills,
  });

  /// Prefix used to look up 'key_name' and 'key_desc' in translations
  final String translationKey;
  final IconData categoryIcon;
  final Color color;
  final List<SkillItem> skills;
}

// ─── Data ────────────────────────────────────────────────────────────────────

const skillCategories = [
  SkillCategory(
    translationKey: 'skills_frontend',
    categoryIcon: FontAwesomeIcons.laptop,
    color: AppColors.categoryFrontend,
    skills: [
      SkillItem(name: 'React', faIcon: FontAwesomeIcons.react, color: Color(0xFF61DAFB)),
      SkillItem(name: 'Next.js', faIcon: SimpleIcons.nextdotjs, color: Color(0xFFFFFFFF)),
      SkillItem(name: 'Vue.js', faIcon: FontAwesomeIcons.vuejs, color: Color(0xFF4FC08D)),
      SkillItem(name: 'Quasar', faIcon: SimpleIcons.quasar, color: Color(0xFF1976D2)),
      SkillItem(name: 'JavaScript', faIcon: FontAwesomeIcons.js, color: Color(0xFFF7DF1E)),
      SkillItem(name: 'TypeScript', faIcon: SimpleIcons.typescript, color: Color(0xFF3178C6)),
      SkillItem(name: 'Tailwind', faIcon: SimpleIcons.tailwindcss, color: Color(0xFF38BDF8)),
      SkillItem(name: 'ShadCN', faIcon: SimpleIcons.shadcnui, color: Color(0xFFFFFFFF)),
    ],
  ),
  SkillCategory(
    translationKey: 'skills_backend',
    categoryIcon: FontAwesomeIcons.server,
    color: AppColors.categoryBackend,
    skills: [
      SkillItem(name: 'Node.js', faIcon: FontAwesomeIcons.nodeJs, color: Color(0xFF68A063)),
      SkillItem(name: 'Express', faIcon: SimpleIcons.express, color: Color(0xFFBBBBBB)),
      SkillItem(name: 'Python', faIcon: FontAwesomeIcons.python, color: Color(0xFFFFD43B)),
      SkillItem(name: 'C/C++', faIcon: SimpleIcons.cplusplus, color: Color(0xFFA8B9CC)),
      SkillItem(name: 'RabbitMQ', faIcon: SimpleIcons.rabbitmq, color: Color(0xFFFF6600)),
      SkillItem(name: 'Socket.IO', faIcon: SimpleIcons.socketdotio, color: Color(0xFF6366F1)),
      SkillItem(name: 'REST API', faIcon: FontAwesomeIcons.code, color: Color(0xFF10B981)),
    ],
  ),
  SkillCategory(
    translationKey: 'skills_mobile',
    categoryIcon: FontAwesomeIcons.mobile,
    color: AppColors.categoryMobile,
    skills: [
      SkillItem(name: 'Flutter', faIcon: SimpleIcons.flutter, color: Color(0xFF54C5F8)),
      SkillItem(name: 'Firebase', faIcon: SimpleIcons.firebase, color: Color(0xFFFFCA28)),
    ],
  ),
  SkillCategory(
    translationKey: 'skills_tools',
    categoryIcon: FontAwesomeIcons.toolbox,
    color: AppColors.categoryTools,
    skills: [
      SkillItem(name: 'MongoDB', faIcon: SimpleIcons.mongodb, color: Color(0xFF47A248)),
      SkillItem(name: 'Git', faIcon: FontAwesomeIcons.gitAlt, color: Color(0xFFF05032)),
      SkillItem(name: 'Docker', faIcon: FontAwesomeIcons.docker, color: Color(0xFF2496ED)),
      SkillItem(name: 'Google Maps', faIcon: SimpleIcons.googlemaps, color: Color(0xFF4285F4)),
    ],
  ),
];
