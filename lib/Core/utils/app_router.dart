import 'package:booklyapp/Features/Search/presentation/views/search_view.dart';
import 'package:booklyapp/Features/Splash/Presentation/Views/splash_view.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/presentation/views/pages/book_details_view.dart';
import 'package:booklyapp/Features/home/presentation/views/pages/home_view.dart';
import 'package:booklyapp/Features/web_view/book_web_view_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/BookDetailsViews';
  static const kSearchView = '/SearchView';
  static const kBookView = '/BookView';

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
          path: AppRouter.kBookDetailsView,
          builder: (context, state) {
            final BookEntity book = state.extra as BookEntity;
            return BookDetailsView(
              book: book,
            );
          }),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
          path: kBookView,
          builder: (context, state) {
            final String pdfUrl = state.extra as String;
            return BookView(
            previewUrl:pdfUrl ,
            );
          }),
    ],
  );
}
