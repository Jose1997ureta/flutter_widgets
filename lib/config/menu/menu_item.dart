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
  MenuItem(
      icon: Icons.refresh_rounded,
      title: 'Progress Indicator',
      subTitle: 'Generales y controlados',
      link: '/progress'),
  MenuItem(
      icon: Icons.info_outline,
      title: 'SnackBars y dialogos',
      subTitle: 'Indicadores de pantalla',
      link: '/snackbar'),
  MenuItem(
      icon: Icons.check_box_outline_blank_rounded,
      title: 'Animated widget animation',
      subTitle: 'Stateful widget animation',
      link: '/animated'),
];
