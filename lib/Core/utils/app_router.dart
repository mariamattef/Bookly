import 'package:booklyapp/Features/Search/presentation/views/search_view.dart';
import 'package:booklyapp/Features/Splash/Presentation/Views/splash_view.dart';
import 'package:booklyapp/Features/home/presentation/views/pages/book_details_view.dart';
import 'package:booklyapp/Features/home/presentation/views/pages/home_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/BookDetailsViews';
  static const kSearchView = '/SearchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => const BookDetailsView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
