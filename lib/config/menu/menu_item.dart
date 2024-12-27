import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItem = <MenuItem>[
  MenuItem(
      icon: Icons.smart_button_outlined,
      title: 'Botones',
      subTitle: 'Varios botones en Flutter',
      link: '/buttons'),
  MenuItem(
      icon: Icons.credit_card,
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards'),
];
