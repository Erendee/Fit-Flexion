import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Ayarlar Ekranı")),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
