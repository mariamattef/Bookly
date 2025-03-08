import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booklyapp/Features/home/domain/repostries/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final HomeRepo bookRepo;

  SearchCubit(this.bookRepo) : super(SearchInitial());

  void searchBooks(String query) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());
    try {
      final books = await bookRepo.searchBooks(query);
      books.fold((failure) {
        emit(SearchError(failure.toString()));
      }, (books) {
        emit(SearchLoaded(books));
      });
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
