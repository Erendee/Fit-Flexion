import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';
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
        title: const Text('Fit Flexion'),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.fire),
            color: Colors.deepOrange,
            onPressed: () {},
          ),
        ],
      ),

      // Ana içerik
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: const Text('Uygulamamıza Hoş Geldiniz'),
            ),
          ),
        ],
      ),

      // Alt navigasyon çubuğu
      bottomNavigationBar: BottomMenu(),
    );
  }
}
