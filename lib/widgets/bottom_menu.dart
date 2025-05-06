import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              context.go("/home");
            },
            icon: Icon(FontAwesomeIcons.dumbbell),
          ),
          IconButton(
            onPressed: () {
              context.go("/reminder");
            },
            icon: Icon(FontAwesomeIcons.penToSquare),
          ),
          IconButton(
            onPressed: () {
              context.go("/calendar");
            },
            icon: Icon(FontAwesomeIcons.calendar),
          ),
          IconButton(
            onPressed: () {
              context.go("/book");
            },
            icon: Icon(CupertinoIcons.book_fill),
          ),
          IconButton(
            onPressed: () {
              context.go("/setting");
            },
            icon: Icon(CupertinoIcons.ellipsis),
          ),
        ],
      ),
    );
  }
}
