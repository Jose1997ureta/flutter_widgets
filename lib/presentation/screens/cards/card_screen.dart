import 'dart:math';

import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {"label": "Elevated 0", "subtitle": "Elevated Subtitle 0", "elevation": 0.0},
  {"label": "Elevated 1", "subtitle": "Elevated Subtitle 1", "elevation": 1.0},
  {"label": "Elevated 2", "subtitle": "Elevated Subtitle 2", "elevation": 2.0},
];

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards Screen"),
      ),
      body: _CardView(),
    );
  }
}

class _CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...cards.map((el) =>
                _CardItemRow(label: el["label"], elevation: el["elevation"])),
            ...cards.map((el) => _CardItemColumn(
                  label: el["label"],
                  elevation: el["elevation"],
                  subtitle: el["subtitle"],
                )),
            ...cards.map((el) => _CardItemShape(
                  label: el["label"],
                  elevation: el["elevation"],
                  subtitle: el["subtitle"],
                )),
            ...cards.map((el) => _CardItemImage(
                  label: el["label"],
                  elevation: el["elevation"],
                )),
          ],
        ),
      ),
    );
  }
}

class _CardItemRow extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardItemRow({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 90,
      child: Card(
        elevation: elevation,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: const TextStyle(backgroundColor: Colors.cyanAccent),
                  ),
                  // const SizedBox(height: 10),
                  const Text("Subtitle")
                ],
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))
            ],
          ),
        ),
      ),
    );
  }
}

class _CardItemColumn extends StatelessWidget {
  final String label;
  final double elevation;
  final String subtitle;

  const _CardItemColumn(
      {required this.label, required this.elevation, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: elevation,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 10, 20),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_outlined))),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style:
                          const TextStyle(backgroundColor: Colors.cyanAccent),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(subtitle)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardItemShape extends StatelessWidget {
  final String label;
  final double elevation;
  final String subtitle;

  const _CardItemShape(
      {required this.label, required this.elevation, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      height: 90,
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: colors.outline),
            borderRadius: BorderRadius.circular(12)),
        elevation: elevation,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("$label shape"), Text(subtitle)],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_outlined)),
                ])),
      ),
    );
  }
}

class _CardItemImage extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardItemImage({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: elevation,
        child: Stack(children: [
          Image.network(
            "https://picsum.photos/id/${elevation.toInt()}/600/250",
            height: 250,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(20))),
              child: IconButton(
                  // color: Colors.white,
                  // style: ButtonStyle(
                  //     backgroundColor: WidgetStateProperty.all(Colors.amber)),
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert_outlined)),
            ),
          ),
        ]),
      ),
    );
  }
}
