part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<BookEntity> books;

  SearchLoaded(this.books);

  @override
  List<Object> get props => [books];
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}
