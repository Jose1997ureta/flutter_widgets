import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  const SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
  const SlideInfo(
      title: "Bienvenido a la aplicacion",
      caption: "lorem ipsum dolor sit amet consectetur adipiscing elit",
      imageUrl: "assets/images/1.png"),
  const SlideInfo(
      title: "Bienvenido a la aplicacion",
      caption: "lorem ipsum dolor sit amet consectetur adipiscing elit",
      imageUrl: "assets/images/2.png"),
  const SlideInfo(
      title: "Bienvenido a la aplicacion",
      caption: "lorem ipsum dolor sit amet consectetur adipiscing elit",
      imageUrl: "assets/images/3.png"),
];

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController _pageController = PageController();

  bool isEnd = false;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      final page = _pageController.page ?? 0.0;

      final int pageFormate = page.floor();

      if (!isEnd && pageFormate == slides.length - 1) {
        setState(() {
          isEnd = true;
        });
      }

      if (isEnd && pageFormate != slides.length - 1) {
        setState(() {
          isEnd = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((item) => _Slide(
                    title: item.title,
                    caption: item.caption,
                    imageUrl: item.imageUrl))
                .toList(),
          ),
          Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                child: const Text("Skip"),
                onPressed: () {
                  context.pop();
                },
              )),
          isEnd
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 10,
                    child: FilledButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: const Text("Comenzar")),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(imageUrl),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(title, style: titleStyle),
          const SizedBox(
            height: 10,
          ),
          Text(caption, style: captionStyle),
        ],
      ),
    );
  }
}
