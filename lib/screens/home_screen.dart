import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<Map<String, String>> _exercises = [
    {"title": "Kol", "image": "assets/images/kol_0.png"},
    {"title": "Bacak", "image": "assets/images/bacak_0.jpg"},
    {"title": "Göğüs", "image": "assets/images/gogus_0.jpg"},
    {"title": "Karın", "image": "assets/images/karin_0.jpg"},
    {"title": "Sırt", "image": "assets/images/sirt_0.jpg"},
    {"title": "Kardiyo", "image": "assets/images/kardiyo_0.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Antrenmanlar',
          style: TextStyle(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: colorScheme.primary,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
      ),
      body: Column(
        children: [
          const SizedBox(height: 48),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: _exercises.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.95,
                ),
                itemBuilder: (context, index) {
                  final item = _exercises[index];
                  return GestureDetector(
                    onTap: () {
                      switch (item['title']) {
                        case 'Kol':
                          context.go('/kol');
                          break;
                        case 'Bacak':
                          context.go('/bacak');
                          break;
                        case 'Göğüs':
                          context.go('/gogus');
                          break;
                        case 'Karın':
                          context.go('/karin');
                          break;
                        case 'Sırt':
                          context.go('/sirt');
                          break;
                        case 'Kardiyo':
                          context.go('/kardiyo');
                          break;
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 3,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.asset(
                                item['image']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                item['title']!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onPrimary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
