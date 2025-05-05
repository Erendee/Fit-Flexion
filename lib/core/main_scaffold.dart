import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouter.of(context).routeInformationProvider;

    return Scaffold(
      body: child, // Aktif içerik burada değişecek

      bottomNavigationBar: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => context.go("/home"),
              icon: Icon(FontAwesomeIcons.dumbbell),
            ),
            IconButton(
              onPressed: () => context.go("/reminder"),
              icon: Icon(FontAwesomeIcons.penToSquare),
            ),
            IconButton(
              onPressed: () => context.go("/calendar"),
              icon: Icon(FontAwesomeIcons.calendar),
            ),
            IconButton(
              onPressed: () => context.go("/book"),
              icon: Icon(CupertinoIcons.book),
            ),
            IconButton(
              onPressed: () => context.go("/another"),
              icon: Icon(CupertinoIcons.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}
