import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC5CAE9),
      // AppBar
      appBar: AppBar(
        title: const Text('Ana Sayfa'),
        actions: [
          IconButton(icon: const Icon(CupertinoIcons.bell), onPressed: () {}),
        ],
      ),

      // Ana içerik
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: const Text('Ana Sayfa İçeriği'),
            ),
          ),
        ],
      ),

      // Menü öğeleri
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.dumbbell),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.penToSquare),
            label: 'Anımsatıcı',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.calendar),
            label: 'Takvim',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_fill),
            label: 'El Kitabı',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.ellipsis),
            label: 'Diğer',
          ),
        ],
        onTap: (index) {
          // Navigasyon işlemleri buraya gelecek
        },
      ),
    );
  }
}
