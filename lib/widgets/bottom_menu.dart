import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});

  final double _iconSize = 32;
  final Offset _iconOffset = const Offset(0, -15);

  @override
  Widget build(BuildContext context) {
    final Color iconColor = Theme.of(context).iconTheme.color ?? Colors.black;

    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Transform.translate(
            offset: _iconOffset,
            child: IconButton(
              onPressed: () {
                context.go("/home");
              },
              icon: const Icon(FontAwesomeIcons.dumbbell),
              iconSize: _iconSize,
              color: iconColor,
            ),
          ),
          Transform.translate(
            offset: _iconOffset,
            child: IconButton(
              onPressed: () {
                context.go("/calendar");
              },
              icon: const Icon(FontAwesomeIcons.calendar),
              iconSize: _iconSize,
              color: iconColor,
            ),
          ),
          Transform.translate(
            offset: _iconOffset,
            child: IconButton(
              onPressed: () {
                context.go("/book");
              },
              icon: const Icon(CupertinoIcons.book_fill),
              iconSize: _iconSize,
              color: iconColor,
            ),
          ),
          Transform.translate(
            offset: _iconOffset,
            child: IconButton(
              onPressed: () {
                context.go("/setting");
              },
              icon: const Icon(CupertinoIcons.ellipsis),
              iconSize: _iconSize,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}
