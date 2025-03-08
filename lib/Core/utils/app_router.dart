import 'package:booklyapp/Core/utils/service_locator.dart';
import 'package:booklyapp/Features/Search/presentation/views/search_view.dart';
import 'package:booklyapp/Features/Splash/Presentation/Views/splash_view.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/repostries/home_repo.dart';
import 'package:booklyapp/Features/home/presentation/manager/search_books_cubit/search_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/pages/book_details_view.dart';
import 'package:booklyapp/Features/home/presentation/views/pages/home_view.dart';
import 'package:booklyapp/Features/web_view/book_web_view_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/BookDetailsViews';
  static const kSearchView = '/SearchView';
  static const kBookView = '/BookView';
  static const kLoading = '/CutomLoadingIndicator';
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
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(getIt<HomeRepo>()),
          child: const SearchView(),
        ),
      ),
      GoRoute(
          path: kBookView,
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;
            final String bookUrl = extra["webUrl"];
            final String title = extra["title"];

            return BookView(
              webUrl: bookUrl,
              title: title,
            );
          }),
    ],
  );
}
