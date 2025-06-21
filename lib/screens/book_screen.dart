import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';
import 'package:go_router/go_router.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  static final List<Map<String, String>> _items = [
    {'title': 'Takviyeler', 'image': 'assets/images/sporcu_besinleri.jpg'},
    {'title': 'Besinler', 'image': 'assets/images/urun_listesi.jpg'},
    {'title': 'Farmakoloji', 'image': 'assets/images/farmakoloji.jpg'},
    {'title': 'Ansiklopedi', 'image': 'assets/images/ansiklopedi.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = theme.scaffoldBackgroundColor;
    final shadowColor = Colors.black26;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
        title: const Text(
          'El Kitabı',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: _items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 18),
        itemBuilder: (context, index) {
          final item = _items[index];
          return InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              switch (item['title']) {
                case 'Takviyeler':
                  context.go('/takviyeler');
                  break;
                case 'Besinler':
                  context.go('/besinler');
                  break;
                case 'Farmakoloji':
                  context.go('/farmakoloji');
                  break;
                case 'Ansiklopedi':
                  context.go('/ansiklopedi');
                  break;
              }
            },
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(item['image']!, fit: BoxFit.cover),
                    Container(color: Colors.black.withOpacity(0.4)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          item['title']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 4,
                                color: Colors.black,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
