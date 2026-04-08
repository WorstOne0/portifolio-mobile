import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//
import 'package:portifolio_mobile/core/main_screen/widgets/appbar.dart';
import 'package:portifolio_mobile/core/main_screen/widgets/bottom_navbar.dart';
import 'package:portifolio_mobile/widgets/stars_background.dart';
import 'package:portifolio_mobile/features/about/pages/about_section.dart';
import 'package:portifolio_mobile/features/contact/pages/contact_section.dart';
import 'package:portifolio_mobile/features/home/pages/home_section.dart';
import 'package:portifolio_mobile/features/projects/pages/projects_section.dart';
import 'package:portifolio_mobile/features/skills/pages/skills_section.dart';
import 'package:portifolio_mobile/services/language_provider.dart';
import 'package:portifolio_mobile/styles/app_theme.dart';
import 'package:portifolio_mobile/translations/translations.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final _scrollController = ScrollController();
  final _sectionKeys = List.generate(5, (_) => GlobalKey());
  int _activeSection = 0;

  // Alternating section backgrounds (null = transparent over stars)
  static const _sectionColors = [null, AppColors.sectionAlt, null, AppColors.sectionAlt, null];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light),
    );
    _scrollController.addListener(_detectActiveSection);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_detectActiveSection);
    _scrollController.dispose();
    super.dispose();
  }

  void _detectActiveSection() {
    if (!mounted) return;
    final threshold = MediaQuery.of(context).size.height * 0.45;

    // Walk backwards — first section whose top ≤ threshold is the active one
    for (var i = _sectionKeys.length - 1; i >= 0; i--) {
      final box = _sectionKeys[i].currentContext?.findRenderObject() as RenderBox?;
      if (box == null) continue;
      if (box.localToGlobal(Offset.zero).dy <= threshold) {
        if (_activeSection != i) setState(() => _activeSection = i);
        return;
      }
    }
  }

  void _scrollToSection(int index) {
    final ctx = _sectionKeys[index].currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(ctx, duration: const Duration(milliseconds: 650), curve: Curves.easeInOut);
  }

  void _toggleLanguage() {
    final current = ref.read(languageProvider);
    ref.read(languageProvider.notifier).state = current == 'pt' ? 'en' : 'pt';
  }

  @override
  Widget build(BuildContext context) {
    final lang = ref.watch(languageProvider);
    final translation = AppTranslations.get(lang);

    final navLabels = [
      translation['nav_home'] as String,
      translation['nav_about'] as String,
      translation['nav_skills'] as String,
      translation['nav_projects'] as String,
      translation['nav_contact'] as String,
    ];

    // Build sections inline so we can pass callbacks
    final sections = <Widget>[
      HomeSection(onCtaTap: () => _scrollToSection(2)),
      const AboutSection(),
      const SkillsSection(),
      const ProjectsSection(),
      const ContactSection(),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      extendBodyBehindAppBar: true,
      appBar: PortfolioAppBar(lang: lang, onToggle: _toggleLanguage),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Stars fill the whole viewport, including behind the AppBar
          const StarsBackground(),

          SingleChildScrollView(
            controller: _scrollController,
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Space for AppBar + status bar so content isn't hidden
                SizedBox(height: MediaQuery.of(context).padding.top + kToolbarHeight),

                // Render each section wrapped with its key and background
                for (var i = 0; i < sections.length; i++)
                  Container(key: _sectionKeys[i], color: _sectionColors[i], child: sections[i]),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(activeIndex: _activeSection, labels: navLabels, onTap: _scrollToSection),
    );
  }
}
