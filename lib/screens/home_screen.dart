import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar
      appBar: AppBar(title: const Text('Fit Flexion')),

      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  CupertinoIcons.person_circle,
                  size: 50,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              accountName: Text("Hoşgeldiniz"),
              accountEmail: null,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.dumbbell),
              title: Text('Ana Sayfa'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.penToSquare),
              title: Text('Anımsatıcı'),
              onTap: () => context.push("/reminder"),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.calendar),
              title: Text('Takvim'),
              onTap: () => context.push("/calendar"),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.book),
              title: Text('El Kitabı'),
              onTap: () => context.push("/book"),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.ellipsis),
              title: Text('Diğer'),
              onTap: () => context.push("/another"),
            ),
            Spacer(),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Çıkış Yap'),
              // onTap: () => context.go("/login"),
            ),
          ],
        ),
      ),

      // Ana içerik
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: const Text('Fitness uygulamamıza hoş geldiniz'),
            ),
          ),
        ],
      ),
    );
    // Navigasyon işlemleri buraya gelecek
  }
}
