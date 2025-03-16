import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/use_cases/newest_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newestbooks_state.dart';

class NewestbooksCubit extends Cubit<NewestbooksState> {
  NewestbooksCubit(this._newestBooksUseCase) : super(NewestbooksInitial());

  final NewestBooksUseCase _newestBooksUseCase;
  List<BookEntity> books = [];
  int currentPage = 1;
  bool isFetching = false;
  bool hasMore = true; // Ensure we stop fetching if no more items

  Future<void> fetchNewestBooks({bool isRefresh = false}) async {
    if (isFetching || !hasMore) return; // Prevent unnecessary calls
    isFetching = true;

    if (isRefresh) {
      books.clear();
      currentPage = 1;
      hasMore = true;
      emit(NewestbooksLoading());
    } else if (currentPage == 1) {
      emit(NewestbooksLoading());
    } else {
      emit(NewestbooksPaginationLoading());
    }

    var newestBooks = await _newestBooksUseCase.call(currentPage);
    newestBooks.fold(
      (failure) {
        emit(currentPage == 1
            ? NewestbooksFailure(failure.errorMessage)
            : NewestbooksPaginationFailure(failure.errorMessage));
      },
      (newBooks) {
        if (newBooks.isEmpty) {
          hasMore = false; // Stop fetching when no more books are available
        } else {
          books.addAll(newBooks);
          currentPage++; // Increase page number only when new items are added
        }
        emit(NewestbooksSuccess(List.from(books)));
      },
    );

    isFetching = false;
  }

  // void refreshBooks() => fetchNewestBooks(isRefresh: true);
}





