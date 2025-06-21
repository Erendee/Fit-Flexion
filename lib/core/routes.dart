import 'package:flutter_app/screens/loading_screen.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/screens/premium_screen.dart';
import 'package:flutter_app/screens/register_screen.dart';
import 'package:flutter_app/screens/calendar_screen.dart';
import 'package:flutter_app/screens/book_screen.dart';
import 'package:flutter_app/screens/setting_screen.dart';
import 'package:flutter_app/screens/takviyeler_screen.dart';
import 'package:flutter_app/screens/besinler_screen.dart';
import 'package:flutter_app/screens/farmakoloji_screen.dart';
import 'package:flutter_app/screens/ansiklopedi_screen.dart';
import 'package:flutter_app/screens/kol_screen.dart';
import 'package:flutter_app/screens/bacak_screen.dart';
import 'package:flutter_app/screens/gogus_screen.dart';
import 'package:flutter_app/screens/sirt_screen.dart';
import 'package:flutter_app/screens/karin_screen.dart';
import 'package:flutter_app/screens/kardiyo_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class AuthChangeNotifier extends ChangeNotifier {
  AuthChangeNotifier() {
    FirebaseAuth.instance.authStateChanges().listen((_) {
      notifyListeners();
    });
  }
}

final authChangeNotifier = AuthChangeNotifier();

final router = GoRouter(
  initialLocation: '/',
  refreshListenable: authChangeNotifier,
  redirect: (context, state) {
    final user = FirebaseAuth.instance.currentUser;
    final loggingIn = ['/login', '/register'].contains(state.uri.path);

    if (state.uri.path == '/') {
      return null;
    }

    if (user == null) {
      return loggingIn ? null : '/login';
    }

    if (loggingIn) return '/home';

    return null;
  },
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoadingScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/calendar',
      builder: (context, state) => const CalendarScreen(),
    ),
    GoRoute(path: '/book', builder: (context, state) => const BookScreen()),
    GoRoute(
      path: '/setting',
      builder: (context, state) => const SettingScreen(),
    ),
    GoRoute(
      path: '/takviyeler',
      builder: (context, state) => const TakviyelerScreen(),
    ),
    GoRoute(
      path: '/besinler',
      builder: (context, state) => const BesinlerScreen(),
    ),
    GoRoute(
      path: '/farmakoloji',
      builder: (context, state) => const FarmakolojiScreen(),
    ),
    GoRoute(
      path: '/ansiklopedi',
      builder: (context, state) => const AnsiklopediScreen(),
    ),
    GoRoute(path: '/kol', builder: (context, state) => const KolScreen()),
    GoRoute(path: '/bacak', builder: (context, state) => const BacakScreen()),
    GoRoute(path: '/gogus', builder: (context, state) => const GogusScreen()),
    GoRoute(path: '/sirt', builder: (context, state) => const SirtScreen()),
    GoRoute(path: '/karin', builder: (context, state) => const KarinScreen()),
    GoRoute(
      path: '/kardiyo',
      builder: (context, state) => const KardiyoScreen(),
    ),
    GoRoute(
      path: '/premium',
      builder: (context, state) => const PremiumScreen(),
    ),
  ],
);
