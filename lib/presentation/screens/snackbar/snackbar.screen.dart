import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  const SnackBarScreen({super.key});

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Hola Mundo"),
      action: SnackBarAction(
        label: "Ok!!",
        onPressed: () {
          context.go("/");
        },
      ),
      duration: const Duration(seconds: 2),
    ));
  }

  void openDialog(BuildContext context) {
    showAdaptiveDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: const Text("Estas seguro"),
              content: const Text("Estas seguro de realizar esta accion"),
              actions: [
                TextButton(
                    onPressed: () => context.pop(),
                    child: const Text("Cancelar")),
                FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text("Aceptar")),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBar y Dialog"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    showAboutDialog(
                        context: context,
                        applicationName: "Show About Dialog",
                        children: [
                          const Text(
                              "lorem ipsum dolor sit amet consectetur adipiscing elit"),
                        ]);
                  },
                  child: const Text("Licencia usados"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton(
                  onPressed: () => openDialog(context),
                  child: const Text("Mostrar Dialogo"),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showSnackBar(context),
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text("Mostrar SnackBar"),
      ),
    );
  }
}
