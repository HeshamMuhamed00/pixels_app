import 'package:go_router/go_router.dart';
import 'package:pixels_app/home/presentation/view/home_view.dart';
import 'package:pixels_app/home/presentation/view/widget/image_details.dart';
import 'package:pixels_app/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/homeView',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/imageDetails',
        builder: (context, state) => const ImageDetails(),
      ),
    ],
  );
}
