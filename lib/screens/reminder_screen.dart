import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Anımsatıcı Ekranı")),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
