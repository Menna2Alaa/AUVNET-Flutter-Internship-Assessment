import 'package:e_commerce_app/widgets/custome_text.dart';
import 'package:e_commerce_app/widgets/shortcuts_items.dart';
import 'package:flutter/material.dart';

class CustomeShortcuts extends StatelessWidget {
  const CustomeShortcuts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CustomeText(
            text: 'Shortcuts',
            textColor: Colors.black,
            fontSize: 18,
            font: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ShortcutsItems(icon: Icons.history, text: 'Orders'),
              SizedBox(width: 20),
              ShortcutsItems(icon: Icons.local_offer, text: 'Super saver'),
              SizedBox(width: 20),
              ShortcutsItems(icon: Icons.star, text: 'Must_tries'),
              SizedBox(width: 20),

              ShortcutsItems(icon: Icons.volunteer_activism, text: 'Feed back'),
              SizedBox(width: 20),
              ShortcutsItems(icon: Icons.thumb_up, text: 'Best sellers'),
            ],
          ),
        ),
      ],
    );
  }
}
