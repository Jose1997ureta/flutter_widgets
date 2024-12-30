import 'package:flutter_widgets/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: "/", builder: (context, state) => const HomeScreen()),
  GoRoute(path: "/buttons", builder: (context, state) => const ButtonScreen()),
  GoRoute(path: "/cards", builder: (context, state) => const CardScreen()),
  GoRoute(
      path: "/progress", builder: (context, state) => const ProgressScreen()),
  GoRoute(
      path: "/snackbar", builder: (context, state) => const SnackBarScreen()),
  GoRoute(
      path: "/animated", builder: (context, state) => const AnimatedScreen()),
  GoRoute(
      path: "/ui-controls",
      builder: (context, state) => const UiControlsScreen()),
  GoRoute(
      path: "/tutorial",
      builder: (context, state) => const AppTutorialScreen()),
]);
