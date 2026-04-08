import 'package:go_router/go_router.dart';

import 'package:portifolio_mobile/core/main_screen/pages/main_screen.dart';
import 'package:portifolio_mobile/features/splash/pages/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/', builder: (context, state) => const MainScreen()),
  ],
);
