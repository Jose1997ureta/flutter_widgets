import 'package:flutter/material.dart';

class SnackBarScreen extends StatelessWidget {
  const SnackBarScreen({super.key});

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Hola Mundo"),
      action: SnackBarAction(
        label: "Ok!!",
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBar y Dialog"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showSnackBar(context),
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text("Mostrar SnackBar"),
      ),
    );
  }
}
