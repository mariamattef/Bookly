import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  List<BookEntity> books = [];
  int currentPage = 0;
  bool isFetching = false;
  bool hasMore = true;

 Future<void> fetchFeaturedBooks({int pageNumber = 0, bool isRefresh = false}) async {
  if (isFetching || !hasMore) return;
  isFetching = true;

  if (isRefresh) {
    books.clear();
    currentPage = 0;
    hasMore = true;
    emit(FeaturedBooksLoading());
  } else if (pageNumber == 0) {
    emit(FeaturedBooksLoading());
  } else {
    emit(FeaturedBooksPaginationLoading(books));
  }

  var featuredBooks = await fetchFeaturedBooksUseCase.call(pageNumber);

  featuredBooks.fold(
    (failure) {
      emit(pageNumber == 0
          ? FeaturedBooksFailure(failure.errorMessage)
          : FeaturedBooksPaginationFailure(failure.errorMessage));
    },
    (newBooks) {
      if (newBooks.isEmpty) {
        hasMore = false;
      } else {
        books.addAll(newBooks);
        currentPage++;
      }
      emit(FeaturedBooksSuccess(List.from(books)));
    },
  );

  isFetching = false;
}



}

















// import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
// import 'package:booklyapp/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// part 'featured_books_state.dart';

// class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
//   FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
//       : super(FeaturedBooksInitial());
//   FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;

//   Future<void> fetchFeaturedBooks({int pageNumber = 0, context}) async {
//     if (pageNumber == 0) {
//       //delay

//       emit(FeaturedBooksLoading());
//       Future.delayed  (const Duration(seconds: 500));
//     } else {
//       final currentState = state;
//       if (currentState is FeaturedBooksSuccess) {
//         emit(FeaturedBooksPaginationLoading(currentState.books));
//       }
//     }

//     var featuredBooks = await fetchFeaturedBooksUseCase.call(pageNumber);

//     featuredBooks.fold(
//       (failure) {
//         if (pageNumber == 0) {
//           emit(FeaturedBooksFailure(failure.errorMessage));
//         } else {
//           emit(FeaturedBooksPaginationFailure(failure.errorMessage));
//         }
//       },
//       (books) {
//         if (pageNumber == 0) {
//           emit(FeaturedBooksSuccess(books));
//         } else {
//           final currentState = state;
//           if (currentState is FeaturedBooksSuccess) {
//             emit(FeaturedBooksSuccess([...currentState.books, ...books]));
//           } else if (currentState is FeaturedBooksPaginationLoading) {
//             emit(FeaturedBooksSuccess([...currentState.books, ...books]));
//           } else {
//             emit(FeaturedBooksSuccess(books));
//           }
//         }
//       },
//     );
//   }
// }
