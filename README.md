# Lucca Gabriel — Portfolio Mobile

> A Flutter mobile portfolio app replicating the feel and content of a Next.js portfolio — dark theme, glassmorphism UI, smooth animations, and bilingual support.

---

## 🚀 Features

- **5 portfolio sections** — Home, About, Skills, Projects, Contact
- **Bilingual (PT/EN)** — language toggle powered by Riverpod
- **Dark-only theme** — deep navy palette with glassmorphism cards
- **Animated transitions** — entry animations via `flutter_animate`
- **Animated star background** — immersive space-like canvas
- **External link handling** — GitHub, LinkedIn, and project URLs via `url_launcher`
- **Splash screen** — branded entry point before the main shell

---

## 📸 Preview

The app opens with a branded splash screen and navigates to a bottom-nav shell with five sections. Each section uses glass-morphism cards, accent gradients, and staggered enter animations. Screenshots/GIFs not yet included.

---

## 🛠 Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter 3 / Dart |
| State Management | Riverpod 2 |
| Navigation | go_router 14 |
| Fonts | Google Fonts — Nunito |
| Icons | Font Awesome Flutter, Simple Icons |
| Animations | flutter_animate |
| Links | url_launcher |
| Linting | flutter_lints |

---

## 📂 Project Structure

```
lib/
├── main.dart                  # App entry point, ProviderScope
├── core/
│   ├── router.dart            # GoRouter — /splash and / routes
│   └── main_screen/
│       ├── pages/main_screen.dart
│       └── widgets/           # AppBar, BottomNavBar
├── features/
│   ├── splash/                # Splash screen
│   ├── home/                  # Hero section, CTA button, tech icon cards
│   ├── about/                 # Timeline items
│   ├── skills/                # Skill badges grouped by category
│   ├── projects/              # Project cards with tech tags and links
│   └── contact/               # Contact link cards
├── services/
│   ├── language_provider.dart # StateProvider<String> — 'pt' | 'en'
│   ├── navigation_provider.dart
│   └── url_launcher_service.dart
├── styles/
│   └── app_theme.dart         # AppTheme.dark + AppColors palette
├── translations/
│   ├── en.dart
│   ├── pt.dart
│   └── translations.dart      # AppTranslations.get(lang)
├── utils/
│   └── context_extensions.dart
└── widgets/
    ├── glass_card.dart        # Reusable glassmorphism card
    └── stars_background.dart  # Animated star field
```

---

## ⚙️ Installation

**Prerequisites:** Flutter SDK `^3.11.4`, Android Studio or Xcode for emulators.

```bash
# Clone the repository
git clone <repo-url>
cd portifolio_mobile

# Install dependencies
flutter pub get

# (Optional) Regenerate launcher icons
flutter pub run flutter_launcher_icons
```

---

## ▶️ Usage

```bash
# Run on connected device or emulator
flutter run

# Build release APK
flutter build apk --release

# Build release iOS (macOS only)
flutter build ios --release
```

The app starts at `/splash`, then routes to `/` (the main shell with bottom navigation).

---

## 🔌 Integrations

| Integration | Purpose |
|---|---|
| `url_launcher` | Opens GitHub profile, LinkedIn, and project repository links |
| `google_fonts` | Loads Nunito font at runtime |
| `simple_icons` / `font_awesome_flutter` | Brand and tech stack icons in the Skills section |

No backend or API keys required — all content is hardcoded in translation files and `skill_data.dart`.

---

## 🧪 Testing

```bash
flutter test
```

Widget and unit tests use the standard `flutter_test` package. No additional test infrastructure is configured.

---

## 📌 Roadmap

- [ ] Light theme support
- [ ] Animated project detail page
- [ ] Deep links to individual sections
- [ ] Web build parity with Next.js portfolio

---

## 🤝 Contributing

This is a personal portfolio project, but suggestions and improvements are welcome.

1. Fork the repo
2. Create a feature branch: `git checkout -b feat/your-feature`
3. Commit your changes
4. Open a pull request

---

## 📄 License

This project is not under an open-source license. All rights reserved by Lucca Gabriel.

---

**Short description (≤160 chars):** Flutter portfolio app with dark glassmorphism UI, bilingual PT/EN support, and animated sections — built with Riverpod and go_router.

**Suggested GitHub tags:** `flutter`, `portfolio`, `riverpod`, `go-router`, `dart`, `glassmorphism`, `dark-theme`, `mobile`, `flutter-animate`, `personal-portfolio`
