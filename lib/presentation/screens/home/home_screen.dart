import 'package:flutter/material.dart';
import 'package:flutter_widgets/config/menu/menu_item.dart';
import 'package:flutter_widgets/presentation/screens/buttons/button_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter + Material 3"),
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItem.length,
      itemBuilder: (context, index) {
        final item = appMenuItem[index];

        return _CustomListTile(item: item);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.item,
  });

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.primary,
      ),
      leading: Icon(
        item.icon,
        color: colors.primary,
      ),
      title: Text(item.title),
      subtitle: Text(item.subTitle),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ButtonScreen()));
      },
    );
  }
}
