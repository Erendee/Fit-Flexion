import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  List<DateTime> _completedDays = [];

  int _totalCompletedDays = 0;
  int _longestStreak = 0;

  final List<String> _days = [
    'Pzt',
    'Salı',
    'Çar',
    'Per',
    'Cuma',
    'Cmt',
    'Paz',
  ];

  @override
  void initState() {
    super.initState();
    _fetchCompletedDays();
  }

  Future<void> _fetchCompletedDays() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('series')
        .doc('genel')
        .get();

    if (doc.exists) {
      final data = doc.data();
      final timestamps =
          (data?['completedDays'] as List<dynamic>?)
              ?.map((e) => (e as Timestamp).toDate())
              .toList() ??
          [];

      List<DateTime> dates = timestamps
          .map((dt) => DateTime(dt.year, dt.month, dt.day))
          .toSet()
          .toList();
      dates.sort();

      final totalDays = dates.length;

      int longestStreak = 0;
      int currentStreak = 0;
      DateTime? previousDate;

      for (final date in dates) {
        if (previousDate == null) {
          currentStreak = 1;
        } else {
          final diff = date.difference(previousDate).inDays;
          if (diff == 1) {
            currentStreak++;
          } else if (diff > 1) {
            if (currentStreak > longestStreak) longestStreak = currentStreak;
            currentStreak = 1;
          }
        }
        previousDate = date;
      }
      if (currentStreak > longestStreak) longestStreak = currentStreak;

      setState(() {
        _completedDays = dates;
        _totalCompletedDays = totalDays;
        _longestStreak = longestStreak;
      });
    }
  }

  Future<void> _markTodayAsCompleted() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);

    if (_completedDays.any((d) => isSameDay(d, todayOnly))) return;

    setState(() {
      _completedDays.add(todayOnly);
    });

    final ref = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('series')
        .doc('genel');

    final List<Timestamp> timestampList = _completedDays
        .map((d) => Timestamp.fromDate(d))
        .toList();

    await ref.set({'completedDays': timestampList});
  }

  @override
  Widget build(BuildContext context) {
    final textColor =
        Theme.of(context).textTheme.titleLarge?.color ?? Colors.black;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Takvim',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => false,
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
              },
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, _) {
                  final isCompleted = _completedDays.any(
                    (d) => isSameDay(d, day),
                  );
                  if (isCompleted) {
                    return Center(
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: Text(
                      '${day.day}',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                    ),
                  );
                },
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.fire,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Seri Takibi',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(7, (index) {
                      final weekDay = DateTime.now().subtract(
                        Duration(days: DateTime.now().weekday - 1 - index),
                      );
                      final isCompleted = _completedDays.any(
                        (d) => isSameDay(d, weekDay),
                      );
                      return Column(
                        children: [
                          Text(
                            _days[index],
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isCompleted
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(
                                      context,
                                    ).colorScheme.onPrimary.withOpacity(0.24),
                            ),
                            child: isCompleted
                                ? Icon(
                                    Icons.check,
                                    size: 14,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  )
                                : null,
                          ),
                        ],
                      );
                    }),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: SizedBox(
                      width: 190,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          foregroundColor: Theme.of(
                            context,
                          ).colorScheme.onPrimary,
                        ),
                        onPressed: _markTodayAsCompleted,
                        child: const Text(
                          "Hedef Tamamlandı",
                          style: TextStyle(fontSize: 16),
                          softWrap: false,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Toplam Giriş: $_totalCompletedDays',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(width: 20),
                Container(height: 16, width: 1.2, color: Colors.black26),
                const SizedBox(width: 20),
                Text(
                  'En Uzun Seri: $_longestStreak',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
