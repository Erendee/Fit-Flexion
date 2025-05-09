import 'package:go_router/go_router.dart';
import '../screens/reminder_screen.dart';
import 'package:flutter_app/screens/calendar_screen.dart';
import 'package:flutter_app/screens/book_screen.dart';
import 'package:flutter_app/screens/setting_screen.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';

final router = GoRouter(
  initialLocation: '/', // Başlangıç noktası
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoadingScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/reminder',
      builder: (context, state) => const ReminderScreen(),
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
  ],
);
