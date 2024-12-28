import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Button Screen"),
      ),
      body: _ButtonView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).pop();
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Elevated")),
            const ElevatedButton(onPressed: null, child: Text("Disabled")),
            ElevatedButton.icon(
              onPressed: () {},
              label: const Text("Icon"),
              icon: const Icon(Icons.access_alarm_rounded),
            ),
            FilledButton(onPressed: () {}, child: const Text("Filled")),
            FilledButton.icon(
                onPressed: () {},
                label: const Text("Filled Icon"),
                icon: const Icon(Icons.accessibility_new)),
            OutlinedButton(onPressed: () {}, child: const Text("Outlined")),
            TextButton(onPressed: () {}, child: const Text("Text")),
            TextButton.icon(
                onPressed: () {},
                label: const Text('Text Icon'),
                icon: const Icon(Icons.accessibility_new)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.accessibility_new)),
            IconButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(colors.primary),
                    iconColor: const WidgetStatePropertyAll(Colors.white)),
                icon: const Icon(Icons.accessibility_new_rounded)),
            const CustomButton()
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Hola Mundo",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
