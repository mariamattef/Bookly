import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(FeaturedBooksInitial());
  FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0, context}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      final currentState = state;
      if (currentState is FeaturedBooksSuccess) {
        emit(FeaturedBooksPaginationLoading(currentState.books));
      }
    }

    var featuredBooks = await fetchFeaturedBooksUseCase.call(pageNumber);

    featuredBooks.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FeaturedBooksFailure(failure.errorMessage));
        } else {
          emit(FeaturedBooksPaginationFailure(failure.errorMessage));
        }
      },
      (books) {
        if (pageNumber == 0) {
          emit(FeaturedBooksSuccess(books)); 
        } else {
          final currentState = state;
          if (currentState is FeaturedBooksSuccess) {
            emit(FeaturedBooksSuccess(
                [...currentState.books, ...books])); 
          } else if (currentState is FeaturedBooksPaginationLoading) {
            emit(FeaturedBooksSuccess([
              ...currentState.books,
              ...books
            ])); 
          } else {
            emit(FeaturedBooksSuccess(books)); 
          }
        }
      },
    );
  }
}
