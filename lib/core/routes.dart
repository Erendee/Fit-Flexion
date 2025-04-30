import 'package:flutter_app/screens/another_screen.dart';
import 'package:flutter_app/screens/book_screen.dart';
import 'package:flutter_app/screens/calendar_screen.dart';
import 'package:go_router/go_router.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';
import '../screens/reminder_screen.dart';

// Router yapılandırması
final router = GoRouter(
  initialLocation: '/', // Başlangıç rotası
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
      path: '/another',
      builder: (context, state) => const AnotherScreen(),
    ),
  ],
);
