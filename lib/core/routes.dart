import 'package:flutter_app/core/main_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_app/screens/another_screen.dart';
import 'package:flutter_app/screens/book_screen.dart';
import 'package:flutter_app/screens/calendar_screen.dart';
import '../screens/home_screen.dart';
import '../screens/reminder_screen.dart';

// Router yapılandırması
final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainScaffold(child: child),
      routes: [
        GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
        GoRoute(
          path: '/reminder',
          builder: (context, state) => ReminderScreen(),
        ),
        GoRoute(
          path: '/calendar',
          builder: (context, state) => CalendarScreen(),
        ),
        GoRoute(path: '/book', builder: (context, state) => BookScreen()),
        GoRoute(path: '/another', builder: (context, state) => AnotherScreen()),
      ],
    ),
  ],
);
