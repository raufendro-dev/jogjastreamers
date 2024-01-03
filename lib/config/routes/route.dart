import 'package:go_router/go_router.dart';
import 'package:jogja_streamers/pages/homeScreen.dart';
import 'package:jogja_streamers/pages/loginScreen.dart';
import '../../pages/splashScreen.dart';

class RouterX {
  var router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
