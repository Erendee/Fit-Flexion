import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("El Kitabı Ekranı")),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
