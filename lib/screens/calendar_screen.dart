import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Takvim Ekranı")),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
